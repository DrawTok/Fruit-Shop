import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/product/product_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:fruitshop/widgets/custom_button.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    bool hasProductQuantity = controller.product.quantity > 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Obx(() {
        String image = controller.product.image;
        String name = controller.product.name;
        String description = controller.product.description;
        int price = controller.product.price;

        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(image),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(TSizes.spacing10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductInfo(name, price),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(description)),
                        Text('Số lượng còn lại: ${controller.product.quantity}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: TColors.graySecOpacity,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.spacing10),
                child:
                    _buildPriceSection(price, controller, hasProductQuantity),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget _buildProductInfo(String name, int price) {
    String formattedPrice = TFormatter.formatCurrency(price);
    return Padding(
      padding: const EdgeInsets.all(TSizes.spacing10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: Styles.title1),
          Text(formattedPrice, style: Styles.title1)
        ],
      ),
    );
  }

  Widget _buildPriceSection(
      int price, ProductController controller, bool hasProductQuantity) {
    int quantity = controller.quantity.value;
    String formattedPrice = TFormatter.formatCurrency(price * quantity);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formattedPrice, style: Styles.title2),
            Row(
              children: [
                _buildButton(Icons.remove, Colors.white, Colors.grey,
                    controller.handleDecrease),
                const SizedBox(width: TSizes.spacing10),
                Obx(() =>
                    Text('${controller.quantity.value}', style: Styles.title2)),
                const SizedBox(width: TSizes.spacing10),
                _buildButton(
                    Icons.add,
                    Colors.white,
                    hasProductQuantity ? Colors.green : Colors.grey,
                    controller.handleIncrease),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.sizeBoxHeight20),
        CustomButton(
          text: hasProductQuantity ? TTexts.addCart : TTexts.outOfStock,
          onPressed: hasProductQuantity ? controller.addCart : () {},
          bgColor:
              hasProductQuantity ? TColors.greenPrimary : TColors.redPrimary,
        ),
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
