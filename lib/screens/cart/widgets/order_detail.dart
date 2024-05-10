import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderDetail extends GetView<CartController> {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spacing16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderSummary(TTexts.totalAmount, controller.totalAmount.value),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          _buildOrderSummary(TTexts.deliveryCharges, 1000),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          _buildOrderSummary(TTexts.discount, controller.coupons.value),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          _buildOrderSummary(
              TTexts.totalPayment, controller.totalPayment.value),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          Text(TTexts.coupons, style: Styles.title1),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          GestureDetector(
              onTap: controller.applyCoupons,
              child: DottedBorder(
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.spacing8, vertical: TSizes.spacing10),
                color: TColors.graySecondary,
                strokeWidth: 1,
                child: Row(
                  children: [
                    Icon(Iconsax.ticket, color: TColors.greenPrimary),
                    const SizedBox(width: TSizes.sizeBoxHeight10),
                    Text(controller.coupons.value != 0
                        ? TTexts.couponsApplied
                        : TTexts.pickCoupons)
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Row _buildOrderSummary(String label, int price) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label),
        Text(TFormatter.formatCurrency(price), style: Styles.title2)
      ]);
}
