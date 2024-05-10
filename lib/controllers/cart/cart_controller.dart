import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/http/http_payment.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/providers/database_provider.dart';
import 'package:fruitshop/screens/cart/widgets/shipping_info.dart';
import 'package:fruitshop/screens/voucher/voucher.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:fruitshop/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find<CartController>();
  ProfileController profileController = Get.put(ProfileController());

  //info screen
  var formKeyInfo = GlobalKey<FormState>();
  String phone = '', address = '';
  int preSelected = 0;
  RxInt selectedOptions = 0.obs;

  //cart screen
  var products = [].obs;
  RxBool isLoading = true.obs;
  RxBool isEdit = false.obs;
  var checkBoxList = <RxBool>[].obs;
  var totalAmount = 0.obs;
  var totalPayment = 0.obs;
  var coupons = 0.obs;
  int? discount = 0;
  var nameCoupons = '';
  Timer? _updateDebounce;
  String token = "";

  void handleQuantityChange(int index, int changeAmount) {
    /*var product = Map.from(products[index]);
    int currentQuantity = product.getOrderQuantity;
    int price = product.price;*/

    var product = products[index];
    int currentQuantity = product.getOrderQuantity;
    int price = product.price;

    int newQuantity = currentQuantity + changeAmount;
    if (newQuantity < 1) {
      totalAmount.value -= currentQuantity * price;
    } else {
      product['orderQuantity'] = newQuantity;
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

  void handleUpdateProduct(int index, int count) {
    var productId = products[index].id;
    if (count < 1) {
      products.removeAt(index);
      checkBoxList.removeAt(index);
      DatabaseProvider.deleteCart(productId);
    }
    DatabaseProvider.updateCart(productId, {'orderQuantity': count});
  }

  void handleEdit() {
    isEdit.value = !isEdit.value;
  }

  void onChangeCheckBox(int index, bool check) {
    checkBoxList[index].value = check;
  }

  void onDeleteSelectedItem() {
    if (products.isEmpty) {
      return;
    }
    var selectedProductIds = [];

    for (int i = checkBoxList.length - 1; i >= 0; i--) {
      if (checkBoxList[i].value == true) {
        selectedProductIds.add(products[i].id);
        products.removeAt(i);
        checkBoxList.removeAt(i);
      }
    }

    DatabaseProvider.deleteSelectedCart(selectedProductIds);

    calcTotalAmount();
    calcTotalPayment();
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

  void setAddress(String value) => address = value;

  Future<void> addProductToCartDB() async {
    var cartItems = products
        .map((product) => {
              "_id": product.id,
              "count": product.getOrderQuantity,
            })
        .toList();
    var response = await THttpHelper.postWithToken(
        "user/cart/", {"cart": cartItems}, token);
    if (response["products"] != null) {
      print("Success");
    } else {
      print("Error");
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
            "address": address,
            "email": profileController.email,
            "methodPayment": selectedOptions.value == 0 ? "Tien mat" : "MoMo",
            "phoneNumber": phone
          },
          "orderItems": orderItems,
          "totalPrice": totalPayment.value
        },
        token);

    return response;
  }

  void handlePayment() async {
    final isValid = formKeyInfo.currentState!.validate();
    if (!isValid) {
      return;
    }


    var response = await createOrder();
    String orderId = response["order"]["_id"];
    if(orderId.isNotEmpty){
      sendDataToMoMo(orderId);
    }else{
      print("Error responseOrderId");
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
      launchUrl(uri);
    } else {
      throw 'Can not open app';
    }
  }

  Future<void> getAllCartFromDB() async {
    isLoading.value = true;
    var response = await THttpHelper.getWithToken("user/cart", token);

    if (response.isNotEmpty && response[0]["products"] != null) {
      List<ProductModel> productList = [];
      ProductModel model;
      for (var index = 0; index < response[0]["products"].length; index++) {
        model =
            ProductModel.fromJson(response[0]["products"][index]["product"]);
        model.orderQuantity = response[0]["products"][index]["count"];
        productList.add(model);
      }
      products.assignAll(productList);

      if (products.isNotEmpty) {
        checkBoxList.value =
            List.generate(products.length, (index) => RxBool(false));
      }
    }
    calcTotalAmount();
    calcTotalPayment();
    isLoading.value = false;
  }

  @override
  void onInit() {
    TLocalStorage localStorage = TLocalStorage();
    Map<String, dynamic>? user = localStorage.readData('user');
    token = user!['token'];
    //getAllCartFromDB();
    super.onInit();
  }

  @override
  void dispose() {
    _updateDebounce?.cancel();
    super.dispose();
  }
}
