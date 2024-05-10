import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class Skelton extends StatelessWidget {
  final double? height, width, borderRadius;

  const Skelton(
      {super.key,
      this.height,
      this.width,
      this.borderRadius = TSizes.borderRadius10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(TSizes.spacing8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(borderRadius!)),
    );
  }
}
