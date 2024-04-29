import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory(
      {super.key,
      required this.id,
      required this.imageUrl,
      this.isNetworkImage = false,
      required this.nameCategory,
      required this.width,
      required this.onChooseCategory});

  final String id;
  final String imageUrl;
  final bool isNetworkImage;
  final String nameCategory;
  final double width;
  final Function(String id) onChooseCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChooseCategory(id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spacing8, vertical: TSizes.spacing8),
        child: Container(
          width: width,
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: TSizes.spacing8),
          decoration: BoxDecoration(
              color: TColors.graySecOpacity,
              borderRadius: BorderRadius.circular(TSizes.borderRadius10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: isNetworkImage
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl) as ImageProvider,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: TSizes.spacing8),
                Text(
                  nameCategory,
                  style: Styles.title2,
                ),
              ]),
        ),
      ),
    );
  }
}
