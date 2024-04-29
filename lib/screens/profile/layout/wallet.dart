import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key, required this.url, required this.label});

  final String url;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.graySecOpacity,
          borderRadius: BorderRadius.circular(TSizes.borderRadius10)),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.spacing8, vertical: TSizes.spacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(url, height: 30),
              const SizedBox(width: TSizes.spacing8),
              Text(
                label,
                style: Styles.title2,
              )
            ],
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
