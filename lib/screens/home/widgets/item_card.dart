import 'package:flutter/material.dart';
import 'package:fruitshop/models/product_model.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';

class ItemCard extends StatelessWidget {
  final ProductModel productModel;
  final Function(ProductModel productModel) addCart;
  final Function(ProductModel productModel) onShowDetail;

  const ItemCard(
      {super.key,
      required this.productModel,
      required this.addCart,
      required this.onShowDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onShowDetail(productModel),
      child: Container(
        decoration: BoxDecoration(
            color: TColors.graySecOpacity,
            borderRadius: BorderRadius.circular(TSizes.borderRadius10)),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: TSizes.spacing20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: productModel.image != TTexts.noImage
                  ? NetworkImage(productModel.image) as ImageProvider
                  : AssetImage(productModel.image),
              height: 100,
              fit: BoxFit.contain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(productModel.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  TFormatter.formatCurrency(productModel.price),
                  style: TextStyle(color: TColors.grayText),
                ),
              ],
            ),
            SizedBox(
                height: 30,
                child: OutlinedButton(
                  onPressed: () => addCart(productModel),
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
      ),
    );
  }
}
