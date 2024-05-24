import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/bottom_bar/bottom_bar_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomBar extends GetView<BottomBarController> {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedItem.value,
          onDestinationSelected: (index) => controller.changeScreen(index),
          destinations: [
            const NavigationDestination(
                icon: Icon(Iconsax.home), label: 'Trang chủ'),
            const NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Danh mục'),
            Stack(children: [
              const NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart), label: 'Giỏ hàng'),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: TColors.greenPrimary,
                        borderRadius:
                            BorderRadius.circular(TSizes.borderRadius10)),
                    child: Text(
                      "${controller.quantityCart.value}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
            ]),
            const NavigationDestination(
                icon: Icon(Iconsax.gift), label: 'Ưu đãi'),
            const NavigationDestination(
                icon: Icon(Iconsax.user), label: 'Thông tin'),
          ],
        ),
        body: controller.screens[controller.selectedItem.value],
      ),
    );
  }
}
