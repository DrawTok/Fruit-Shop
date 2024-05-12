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
                      children: [
                        _buildProductInfo(name, price),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(description)),
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
                child: _buildPriceSection(price, controller),
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

  Widget _buildPriceSection(int price, ProductController controller) {
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
                _buildButton(Icons.remove, Colors.black, Colors.grey,
                    controller.handleDecrease),
                const SizedBox(width: TSizes.spacing10),
                Obx(() =>
                    Text('${controller.quantity.value}', style: Styles.title2)),
                const SizedBox(width: TSizes.spacing10),
                _buildButton(Icons.add, Colors.white, Colors.green,
                    controller.handleIncrease),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.sizeBoxHeight20),
        CustomButton(
          text: TTexts.addCart,
          onPressed: controller.addCart,
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
