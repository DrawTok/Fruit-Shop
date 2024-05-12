import 'package:flutter/material.dart';
import 'package:fruitshop/models/order_item.dart';
import 'package:fruitshop/models/order_model.dart';
import 'package:fruitshop/models/shipping_model.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:fruitshop/widgets/app_bar.dart';

class PurchaseDetail extends StatelessWidget {
  final OrderModel model;
  const PurchaseDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TAppBar(title: TTexts.purchaseInfo),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.spacing8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryAddress(model.shippingModel),
            const SizedBox(height: TSizes.sizeBoxHeight10),
            Divider(height: 1, color: TColors.graySecOpacity),
            const SizedBox(height: TSizes.sizeBoxHeight10),
            _buildProducts(model.orderItems),
            Divider(height: 1, color: TColors.graySecOpacity),
            const SizedBox(height: TSizes.sizeBoxHeight10),
            _buildTransactionDetails(),
            const SizedBox(height: TSizes.sizeBoxHeight20)
          ],
        ),
      ),
    );
  }

  _buildDeliveryAddress(ShippingModel shippingModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TTexts.deliveryAddress, style: Styles.title1),
        Text("Họ tên: ${shippingModel.firstname} ${shippingModel.lastname}"),
        Text("Điện thoại: ${shippingModel.phoneNumber}"),
        Text("Địa chỉ: ${shippingModel.address}"),
      ],
    );
  }

  _buildProducts(List<OrderItem> orderItems) {
    return Expanded(
      child: ListView.builder(
          itemCount: orderItems.length,
          itemBuilder: (_, index) => Column(
                children: [
                  Container(
                    color: TColors.graySecOpacity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(orderItems[index].product.image,
                            height: 80, width: 80, fit: BoxFit.cover),
                        const SizedBox(width: TSizes.sizeBoxHeight10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(orderItems[index].product.name),
                            Text("x${orderItems[index].count}"),
                            Text(TFormatter.formatCurrency(
                                orderItems[index].product.price))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.sizeBoxHeight4),
                ],
              )),
    );
  }

  _buildTransactionDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TTexts.codeOrder, style: Styles.title2),
            Text(model.id, style: Styles.title2)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(TTexts.timeOrder),
            Text(TFormatter.formatDate(model.paidAt))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(TTexts.paymentMethod),
            Text(model.shippingModel.methodPayment)
          ],
        ), Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(TTexts.orderStatus),
            Text(model.isPaid),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TTexts.totalPayment, style: Styles.title2),
            Text(TFormatter.formatCurrency(model.totalPrice),
                style: Styles.title2)
          ],
        )
      ],
    );
  }
}
