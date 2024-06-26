import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class TSliverAppBar extends GetView<HomeController> {
  const TSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.spacing8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(TTexts.appName, style: TextStyle(color: Colors.black)),
                Container(
                  decoration: BoxDecoration(
                      color: TColors.greenPrimary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(TSizes.spacing8)),
                  child: IconButton(
                      color: TColors.greenPrimary,
                      onPressed: controller.openContacts,
                      icon: Icon(
                        Icons.phone,
                        color: TColors.greenPrimary,
                      )),
                )
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.spacing8, vertical: TSizes.spacing8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.borderRadius4),
              color: TColors.graySecOpacity,
            ),
            child: GestureDetector(
              onTap: controller.onSearch,
              child: const Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                      child: Text('Tìm kiếm', style: TextStyle(fontSize: 14)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
