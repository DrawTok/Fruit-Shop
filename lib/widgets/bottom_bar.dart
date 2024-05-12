import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/bottom_bar/bottom_bar_controller.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomBar extends GetView<BottomBarController> {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedItem.value,
          onDestinationSelected: (index) => controller.changeScreen(index),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Trang chủ'),
            NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Danh mục'),
            NavigationDestination(
                icon: Icon(Iconsax.shopping_cart), label: 'Giỏ hàng'),
            NavigationDestination(icon: Icon(Iconsax.gift), label: 'Ưu đãi'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Thông tin'),
          ],
        ),
        body: controller.screens[controller.selectedItem.value],
      ),
    );
  }
}
