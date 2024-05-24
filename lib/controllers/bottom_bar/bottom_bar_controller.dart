import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/screens/cart/cart.dart';
import 'package:fruitshop/screens/category/category.dart';
import 'package:fruitshop/screens/home/home.dart';
import 'package:fruitshop/screens/profile/profile.dart';
import 'package:fruitshop/screens/voucher/voucher.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  static BottomBarController get instance => Get.find();

  var products = [].obs;

  String token = "";
  RxInt quantityCart = 0.obs;

  final screens = [
    const Home(),
    const Category(),
    const Cart(),
    const Voucher(),
    const Profile(),
  ];

  final selectedItem = 0.obs;
  void changeScreen(int index) {
    if (index == 2) {
      getCarts();
    }
    selectedItem.value = index;
  }

  Future<void> getCarts() async {
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
      quantityCart.value = products.length;

      CartController.instance.getAllCartFromDB();
    }
  }



  @override
  void onInit() {
    TLocalStorage localStorage = TLocalStorage();
    Map<String, dynamic>? user = localStorage.readData('user');
    token = user!['token'];
    getCarts();
    super.onInit();
  }
}
