import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/models/order_model.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:get/get.dart';

class PurchaseItem extends GetView<ProfileController> {
  final int index;
  final OrderModel orderModel;

  const PurchaseItem(
      {super.key, required this.index, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    String isPaid = orderModel.isPaid;
    String orderDate = TFormatter.formatDate(orderModel.paidAt);

    return Container(
      padding: const EdgeInsets.all(TSizes.spacing8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Trạng thái: $isPaid", style: Styles.title2),
            InkWell(
                onTap: () {
                  controller.viewOrderDetails(index);
                },
                child: const Row(
                  children: [
                   Text(TTexts.viewDetails),
                    SizedBox(width: TSizes.sizeBoxHeight4),
                    Icon(Icons.arrow_forward_ios, size: 10)
                  ],
                ))
          ]),
          Text("Đặt ngày $orderDate"),
          ListTile(
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: orderModel.orderItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: TSizes.spacing8),
                      child: Container(
                        padding: const EdgeInsets.all(TSizes.spacing8),
                        decoration: BoxDecoration(
                            color: TColors.graySecOpacity,
                            borderRadius:
                                BorderRadius.circular(TSizes.borderRadius4)),
                        child: Row(
                          children: [
                            Image.network(item.product.image, height: 50),
                            const SizedBox(width: TSizes.sizeBoxHeight10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product.name),
                                Text(TFormatter.formatCurrency(
                                    item.product.price))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
