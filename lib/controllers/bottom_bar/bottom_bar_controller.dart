import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/controllers/home/home_binding.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/screens/cart/cart.dart';
import 'package:fruitshop/screens/category/category.dart';
import 'package:fruitshop/screens/home/home.dart';
import 'package:fruitshop/screens/profile/profile.dart';
import 'package:fruitshop/screens/voucher/voucher.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  static BottomBarController get instance => Get.find();
  String token = "";

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
      CartController.instance.getAllCartFromDB();
    }
    selectedItem.value = index;
  }

  @override
  void onInit() {
    TLocalStorage localStorage = TLocalStorage();
    Map<String, dynamic>? user = localStorage.readData('user');
    token = user!['token'];
    super.onInit();
  }
}
