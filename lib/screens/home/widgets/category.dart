import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/screens/home/widgets/item_category.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:get/get.dart';

class TCategory extends GetView<HomeController> {
  const TCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = TDeviceUtility.getScreenWidth(context) / 5;
    return SliverPadding(
      padding: const EdgeInsets.all(TSizes.spacing16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Danh mục', style: Styles.title1),
                GestureDetector(
                    onTap: controller.directionCategory,
                    child: Text('Tất cả', style: Styles.title1)),
              ],
            ),
            const SizedBox(height: TSizes.spacing20),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.categories.map((category) {     
                    return ItemCategory(
                      id: category.id,
                      imageUrl: category.image,
                      nameCategory: category.name,
                      width: screenWidth,
                      isNetworkImage: true,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
