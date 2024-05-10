import 'package:flutter/material.dart';
import 'package:fruitshop/placeholder/loading/skelton.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class CategorySkelton extends StatelessWidget {
  const CategorySkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        direction: ShimmerDirection.ttb,
        enabled: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 6,
            itemBuilder: (_, index) => _buildProduct()));
  }

  Container _buildProduct() {
    return Container(
      decoration: BoxDecoration(
        color: TColors.graySecOpacity,
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(TSizes.spacing10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skelton(height: 100, width: 100),
          SizedBox(height: TSizes.spacing8),
          Skelton(width: 100),
        ],
      ),
    );
  }
}
