import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/search/search_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FilterScreen extends GetView<TSearchController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: controller.showFilterScreen,
              icon: const Icon(Icons.close)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lọc theo', style: Styles.title1),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              Obx(() => buildRowWithRadio(
                  'Giá từ thấp -> cao', 0, controller.selectedOptions.value)),
              const Divider(),
              Obx(() => buildRowWithRadio(
                  'Giá từ cao -> thấp', 1, controller.selectedOptions.value)),
              const Divider(),
              Obx(() => buildRowWithRadio(
                  'Đánh giá', 2, controller.selectedOptions.value)),
            ],
          ),
        ));
  }

  Widget buildRowWithRadio(String text, int value, int groupValue) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Iconsax.star),
              const SizedBox(width: TSizes.spacing8),
              Text(text)
            ],
          ),
          Radio(
            value: value,
            groupValue: controller.selectedOptions.value,
            onChanged: (value) {
              controller.onChangeFilterType(value!.toInt());
            },
            activeColor: TColors.greenPrimary,
          ),
        ],
      ),
    );
  }
}
