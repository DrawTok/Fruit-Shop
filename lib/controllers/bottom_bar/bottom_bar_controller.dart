import 'package:fruitshop/controllers/home/home_binding.dart';
import 'package:fruitshop/screens/cart/cart.dart';
import 'package:fruitshop/screens/category/category.dart';
import 'package:fruitshop/screens/home/home.dart';
import 'package:fruitshop/screens/profile/profile.dart';
import 'package:fruitshop/screens/voucher/voucher.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  BottomBarController get instance => Get.find();

  final screens = [
    GetPage(name: '/home', page: () => const Home(), binding: HomeBinding()),
    GetPage(
      name: '/category',
      page: () => const Category(),
    ),
    GetPage(
      name: '/cart',
      page: () => const Cart(),
    ),
    GetPage(
      name: '/voucher',
      page: () => const Voucher(),
    ),
    GetPage(
      name: '/profile',
      page: () => const Profile(),
    ),
  ];

  final selectedItem = 0.obs;
  void changeScreen(int index) => selectedItem.value = index;
}
