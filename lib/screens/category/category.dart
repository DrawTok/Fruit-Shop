import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/category/category_controller.dart';
import 'package:fruitshop/placeholder/loading/category_skelton.dart';
import 'package:fruitshop/screens/home/widgets/item_category.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = TDeviceUtility.getScreenWidth(context) / 2;
    CategoryController controller = Get.put(CategoryController());
    return Scaffold(
      appBar: const TAppBar(title: "Danh mục"),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing16),
          child: Obx(() => controller.categories.isEmpty
              ? const CategorySkelton()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: controller.categories.length,
                  itemBuilder: (_, index) {
                    var category = controller.categories[index];
                    return ItemCategory(
                        id: category.id,
                        imageUrl: category.image,
                        nameCategory: category.name,
                        width: screenWidth,
                        isNetworkImage: true,
                        onChooseCategory: controller.onChooseCategory);
                  }))),
    );
  }
}
