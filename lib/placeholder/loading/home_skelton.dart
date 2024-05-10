import 'package:flutter/material.dart';
import 'package:fruitshop/placeholder/loading/skelton.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class HomeSkelton extends StatelessWidget {
  const HomeSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            direction: ShimmerDirection.ttb,
            enabled: true,
            child: const Padding(
              padding: EdgeInsets.all(TSizes.spacing10),
              child: _SkeltonCard(),
            )),
      ),
    );
  }
}

class _SkeltonCard extends StatelessWidget {
  const _SkeltonCard();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Skelton(width: double.infinity, height: 150),
      const SizedBox(height: TSizes.spacing20),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(),
            const SizedBox(width: TSizes.spacing8),
            _buildItem(),
            const SizedBox(width: TSizes.spacing8),
            _buildItem(),
            const SizedBox(width: TSizes.spacing8),
            _buildItem(),
          ],
        ),
      ),
      const SizedBox(height: TSizes.spacing20),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildProduct(), _buildProduct()],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildProduct(), _buildProduct()])
        ],
      )
    ]);
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
          Skelton(height: 120, width: 120),
          SizedBox(height: TSizes.spacing8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Skelton(width: 50),
              SizedBox(width: TSizes.spacing8),
              Skelton(width: 50),
            ],
          ),
          SizedBox(height: TSizes.spacing8),
          Skelton(height: 30, width: 100, borderRadius: 4),
        ],
      ),
    );
  }

  Column _buildItem() {
    return const Column(
      children: [
        Skelton(height: 80, width: 80),
        SizedBox(height: TSizes.spacing8),
        Skelton(width: 80)
      ],
    );
  }
}
