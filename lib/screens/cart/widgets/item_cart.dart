import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ItemCart extends GetView<CartController> {
  final int index;
  final bool isVisibleCheckBox;

  const ItemCart(
      {super.key, required this.index, required this.isVisibleCheckBox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spacing8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.borderRadius8),
            color: Colors.grey.withOpacity(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductInfo(index),
            _buildQuantityButtons(index),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(int index) {
    return Row(
      children: [
        if (isVisibleCheckBox)
          Obx(
            () => Checkbox(
              value: controller.checkBoxList[index].value,
              onChanged: (check) {
                controller.onChangeCheckBox(index, check ?? false);
              },
            ),
          ),
        Image(
          image: controller.products[index].image != TTexts.noImage
              ? NetworkImage(controller.products[index].image)
                  as ImageProvider
              : AssetImage(controller.products[index].image),
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: TSizes.sizeBoxHeight10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.products[index].name, style: Styles.title2),
            Text('${controller.products[index].price} VNĐ'),
          ],
        ),
      ],
    );
  }

  Widget _buildQuantityButtons(int index) {
    return Row(
      children: [
        _buildButton(Icons.remove, Colors.black, Colors.grey,
            () => controller.handleDecrease(index)),
        const SizedBox(width: 10),
        Obx(() => Text('${controller.products[index].getOrderQuantity}',
            style: Styles.title2)),
        const SizedBox(width: 10),
        _buildButton(Icons.add, Colors.white, Colors.green,
            () => controller.handleIncrease(index)),
      ],
    );
  }

  Widget _buildButton(
      IconData icon, Color color, Color background, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(shape: BoxShape.circle, color: background),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }
}
