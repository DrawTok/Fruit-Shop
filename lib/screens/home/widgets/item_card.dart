import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:get/get.dart';

class ItemCard extends GetView<HomeController> {
  final int index;
  final String image;
  final String name;
  final int price;

  const ItemCard(
      {super.key,
      required this.index,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.graySecOpacity,
          borderRadius: BorderRadius.circular(TSizes.borderRadius10)),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: TSizes.spacing20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: image != TTexts.noImage
                ? NetworkImage(image) as ImageProvider
                : AssetImage(image),
            height: 100,
            fit: BoxFit.contain,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                TFormatter.formatCurrency(price),
                style: TextStyle(color: TColors.grayText),
              ),
            ],
          ),
          SizedBox(
              height: 30,
              child: OutlinedButton(
                onPressed: () {
                  controller.addCart(index);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: TColors.greenPrimary,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: TColors.blackPrimary),
                ),
              )),
        ],
      ),
    );
  }
}
