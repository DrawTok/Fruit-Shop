import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/search/search_controller.dart';
import 'package:fruitshop/screens/home/widgets/item_card.dart';
import 'package:get/get.dart';

class ProductList extends GetView<TSearchController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
      key: ValueKey(controller.filteredProducts.length),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250),
              itemCount: controller.filteredProducts.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  productModel: controller.filteredProducts[index],
                  addCart: controller.addCart,
                  onShowDetail: controller.displayDetailProduct);
              }),
        ));
  }
}