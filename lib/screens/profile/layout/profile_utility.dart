import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:get/get.dart';

class ProfileUtility extends GetView<ProfileController> {
  const ProfileUtility({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.direction
  });

  final String imageUrl;
  final String title;
  final Function() direction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        direction();
      },
      child: Container(
        padding: const EdgeInsets.only(left: TSizes.spacing16),
        decoration: BoxDecoration(
            color: TColors.graySecOpacity,
            borderRadius: BorderRadius.circular(TSizes.borderRadius10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, height: 50),
            const SizedBox(height: TSizes.spacing8),
            Text(title, style: Styles.title2)
          ],
        ),
      ),
    );
  }
}
