import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruitshop/controllers/bottom_bar/bottom_bar_controller.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/http/http_payment.dart';
import 'package:fruitshop/models/mapbox/feature.dart';
import 'package:fruitshop/screens/cart/widgets/shipping_info.dart';
import 'package:fruitshop/screens/profile/widgets/purchase_history.dart';
import 'package:fruitshop/screens/voucher/voucher.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:fruitshop/utils/validators/validation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find<CartController>();
  final BottomBarController _controller = Get.find<BottomBarController>();
  final ProfileController profileController = Get.put(ProfileController());

  //info screen
  var formKeyInfo = GlobalKey<FormState>();
  String phone = '', streetAddress = '';
  RxString address = ''.obs;
  final TextEditingController textEditingController = TextEditingController();
  int preSelected = 0;
  RxInt selectedOptions = 0.obs;

  //cart screen
  var products = [].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadGPS = false.obs;
  RxBool isEdit = false.obs;
  var checkBoxList = <RxBool>[].obs;
  var totalAmount = 0.obs;
  var totalPayment = 0.obs;
  var coupons = 0.obs;
  int? discount = 0;
  var nameCoupons = '';
  Timer? _updateDebounce;

  void handleQuantityChange(int index, int changeAmount) {
    var product = products[index];
    int currentQuantity = product.getOrderQuantity;
    int price = product.price;

    int newQuantity = currentQuantity + changeAmount;
    if (newQuantity < 1) {
      totalAmount.value -= currentQuantity * price;
    } else {
      product.orderQuantity = newQuantity;
      products[index] = product;
      totalAmount.value += changeAmount * price;
    }

    calcTotalPayment();

    if (_updateDebounce?.isActive ?? false) _updateDebounce?.cancel();
    _updateDebounce = Timer(const Duration(milliseconds: 300), () {
      handleUpdateProduct(index, newQuantity);
    });
  }

  void handleIncrease(int index) {
    handleQuantityChange(index, 1);
  }

  void handleDecrease(int index) {
    handleQuantityChange(index, -1);
  }

  void handleUpdateProduct(int index, int count) async {
    var productId = products[index].id;
    if (count < 1) {
      products.removeAt(index);
      checkBoxList.removeAt(index);
      handleDeleteProduct(productId);
    }
    //DatabaseProvider.updateCart(productId, {'orderQuantity': count});
  }

  void handleEdit() {
    isEdit.value = !isEdit.value;
  }

  void onChangeCheckBox(int index, bool check) {
    checkBoxList[index].value = check;
  }

  void onDeleteSelectedItem() async {
    if (products.isEmpty) {
      return;
    }

    for (int i = checkBoxList.length - 1; i >= 0; i--) {
      if (checkBoxList[i].value == true) {
        await handleDeleteProduct(products[i].id);
        products.removeAt(i);
        checkBoxList.removeAt(i);
      }
    }
    _controller.getCarts();

    calcTotalAmount();
    calcTotalPayment();
  }

  Future<void> handleDeleteProduct(String productId) async {
    var response = await THttpHelper.deleteWithToken(
        "user/delete-product-cart/$productId", _controller.token);
    if (response == null) {
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.errorResponse);
    }
  }

  void applyCoupons() async {
    discount = await Get.to<int?>(const Voucher());

    if (discount == null || discount! <= 0) {
      discount = 0;
      return;
    }

    calcCoupons();
    calcTotalPayment();
  }

  void calcCoupons() {
    coupons.value = (totalAmount.value * discount! / 100).round();
  }

  void calcTotalAmount() {
    totalAmount.value = 0;
    for (int i = 0; i < products.length; i++) {
      totalAmount.value += HelperFunctions.calcTotalAmount(
          products[i].price, products[i].getOrderQuantity);
    }
  }

  void calcTotalPayment() {
    totalPayment.value = 0;
    totalPayment.value += HelperFunctions.calcTotalPayment(
        total: totalAmount.value, coupons: coupons.value);
    calcCoupons();
  }

  void handleRequiredInfo() async {
    Get.to(() => const ShippingInfo());
  }

  void onChangePaymentType(int type) {
    selectedOptions.value = type;
    if (preSelected != selectedOptions.value) {
      preSelected = selectedOptions.value;
    }
  }

  void setPhone(String value) => phone = value;

  String? validatePhone(String? value) => TValidator.validatePhoneNumber(value);

  void setStreetAddress(String value) => streetAddress = value;

  void setAddress(String value) => address.value = value;

  void getMyLocation() async {
    isLoadGPS.value = true;
    Position? position = await TDeviceUtility.requestPermission();
    String accessToken = dotenv.env["ACCESS_TOKEN_MAP"]!;
    if (position != null) {
      var response = await THttpHelper.getAddress(
          position.latitude, position.longitude, accessToken);

      Feature feature = Feature.fromJson(response["features"][0]);
      setAddress("${feature.properties.name},"
          " ${feature.properties.context.locality.name},"
          " ${feature.properties.context.place.name}");
      isLoadGPS.value = false;
    }
  }

  Future<void> addProductToCartDB() async {
    var cartItems = products
        .map((product) => {
              "_id": product.id,
              "count": product.getOrderQuantity,
            })
        .toList();
    var response = await THttpHelper.postWithToken(
        "user/cart/", {"cart": cartItems}, _controller.token);
    if (response["products"] == null) {
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.errorResponse);
    }
  }

  //create order in db
  Future<dynamic> createOrder() async {
    var orderItems = products
        .map((product) =>
            {"product": product.id, "count": product.getOrderQuantity})
        .toList();

    var response = await THttpHelper.postWithToken(
        "user/cart/create-order",
        {
          "shippingInfor": {
            "firstname": profileController.firstName,
            "lastname": profileController.lastName,
            "address": "$streetAddress, $address",
            "email": profileController.email,
            "methodPayment": selectedOptions.value == 0 ? "Tien mat" : "MoMo",
            "phoneNumber": phone
          },
          "orderItems": orderItems,
          "totalPrice": totalPayment.value
        },
        _controller.token);

    return response;
  }

  void handlePayment() async {
    final isValid = formKeyInfo.currentState!.validate();
    if (!isValid) {
      return;
    }

    var response = await createOrder();
    print("Response: $response");
    String orderId = response["order"]["_id"];
    if (orderId.isNotEmpty && selectedOptions.value == 1) {
      sendDataToMoMo(orderId);
    } else {
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.orderSuccess);
    }
  }

  void sendDataToMoMo(String id) async {
    String requestId = const Uuid().v4();
    String orderId = id;
    String ipnUrl = "https://project-server-android.onrender.com/api/user/momo";
    String redirectUrl = "fruitshop://";
    String orderInfo = 'Thanh toán đơn hàng';
    int amount = totalPayment.value;
    String extraData = '';
    String requestType = 'captureWallet';

    String signature = HelperFunctions.generateSignature(
        requestId: requestId,
        amount: amount,
        extraData: extraData,
        orderId: orderId,
        ipnUrl: ipnUrl,
        redirectUrl: redirectUrl,
        orderInfo: orderInfo,
        requestType: requestType);

    var partnerCode = dotenv.env['PARTNER_CODE'].toString();

    var data = {
      "partnerCode": partnerCode,
      "requestId": requestId,
      "amount": amount,
      "orderId": orderId,
      "orderInfo": orderInfo,
      "redirectUrl": redirectUrl,
      "ipnUrl": ipnUrl,
      "requestType": requestType,
      "extraData": extraData,
      "lang": "en",
      "signature": signature,
    };

    var response = await THttpPayment.post('/v2/gateway/api/create', data);
    openMoMo(response['deeplink']);
  }

  Future<void> openMoMo(String deepLink) async {
    Uri uri = Uri.parse(deepLink);
    if (await canLaunchUrl(uri)) {
      bool launched = await launchUrl(uri);
      if (launched) {
        await Get.to(() => const PurchaseHistory());
      } else {
        throw 'Can not open app';
      }
    }
  }

  void getAllCartFromDB() {
    isLoading.value = true;

    products.assignAll(_controller.products);
    if (products.isNotEmpty) {
      checkBoxList.value =
          List.generate(products.length, (index) => RxBool(false));
    }
    calcTotalAmount();
    calcTotalPayment();
    isLoading.value = false;
  }

  @override
  void onInit() {
    ever(address, (value) => textEditingController.text = value);
    ever(_controller.products, (callback) => getAllCartFromDB());
    super.onInit();
  }

  @override
  void dispose() {
    _updateDebounce?.cancel();
    super.dispose();
  }
}
