import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/category/category_controller.dart';
import 'package:fruitshop/screens/home/widgets/item_category.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = TDeviceUtility.getScreenWidth(context) / 2;
    CategoryController _controller = Get.put(CategoryController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh mục'),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing16),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _controller.categories.length,
                itemBuilder: (_, index) {
                  var category = _controller.categories[index];
                  return ItemCategory(
                      id: category.id,
                      imageUrl: category.image,
                      nameCategory: category.name,
                      width: screenWidth,
                      isNetworkImage: true,
                      onChooseCategory: _controller.onChooseCategory);
                })),
      ),
    );
  }
}
