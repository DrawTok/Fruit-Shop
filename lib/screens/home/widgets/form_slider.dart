import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/widgets/rounded_image.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TFormSlider extends GetView<HomeController> {
  const TFormSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
          items: const [
            TRoundedImage(
                url: 'assets/images/image_2.png',
                padding: EdgeInsets.symmetric(horizontal: 5)),
            TRoundedImage(
                url: 'assets/images/image_1.png',
                padding: EdgeInsets.symmetric(horizontal: 5)),
            TRoundedImage(
                url: 'assets/images/image.png',
                padding: EdgeInsets.symmetric(horizontal: 5)),
          ],
          options: CarouselOptions(
            viewportFraction: 0.9,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          )),
      const SizedBox(height: TSizes.spacing8),
      Obx(
        () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => Container(
                      height: 5,
                      width: 20,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: index == controller.currentIndex.value
                              ? TColors.greenPrimary
                              : TColors.graySecondary),
                    ))),
      ),
    ]);
  }
}
