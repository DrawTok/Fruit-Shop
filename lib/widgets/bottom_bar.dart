import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/bottom_bar_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedItem.value,
        onDestinationSelected: (index) => controller.selectedItem.value = index,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favorite'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
      body: Obx(() => controller.screens[controller.selectedItem.value]),
    );
  }
}
