import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/search/search_controller.dart';
import 'package:fruitshop/placeholder/loading/loading.dart';
import 'package:fruitshop/screens/search/widgets/filter.dart';
import 'package:fruitshop/screens/search/widgets/product_list.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TSearchController controller = Get.put(TSearchController());
    return Obx(
      () => controller.isFilter.value
          ? const FilterScreen()
          : Scaffold(
              appBar: AppBar(
                leadingWidth: 40,
                title: _buildSearchField(controller),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.showFilterScreen();
                      },
                      icon: const Icon(Iconsax.filter))
                ],
              ),
              body: controller.isLoading.isTrue
                  ? const TLoading()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.spacing8),
                      child: const Column(
                        children: [ProductList()],
                      ),
                    )),
    );
  }

  Widget _buildSearchField(TSearchController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing8),
      height: 40,
      decoration: BoxDecoration(
          color: TColors.graySecOpacity,
          borderRadius: BorderRadius.circular(TSizes.borderRadius8)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Tìm kiếm...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: TColors.blackPrimary),
        ),
        style: Styles.title2,
        onChanged: (newQuery) {
          controller.updateQuery(newQuery);
        },
      ),
    );
  }
}
