import 'package:flutter/material.dart';
import 'package:fruitshop/placeholder/loading/skelton.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class VoucherSkelton extends StatelessWidget {
  const VoucherSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        direction: ShimmerDirection.ttb,
        enabled: true,
        child: ListView.builder(
            itemCount: 5,
            itemExtent: MediaQuery.of(context).size.height * 0.15,
            itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(TSizes.spacing10),
                child: _SkeltonCard())));
  }
}

class _SkeltonCard extends StatelessWidget {
  const _SkeltonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.borderRadius8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Skelton(height: 60, width: 60, borderRadius: TSizes.borderRadius100),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skelton(width: 100),
                SizedBox(height: TSizes.sizeBoxHeight10),
                Skelton(width: 140)
              ]),
          Skelton(height: 20, width: 40)
        ],
      ),
    );
  }
}
