import 'package:flutter/widgets.dart';
import 'package:fruitshop/controllers/home/home_controller.dart';
import 'package:fruitshop/screens/home/widgets/item_card.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProductList extends GetView<HomeController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) => ItemCard(
                  index: index,
                  productId: controller.products[index].id,
                  image: controller.products[index].image,
                  name: controller.products[index].name,
                  price: controller.products[index].price,
                  addCart: controller.addCart,
                  onShowDetail: controller.displayDetailProduct),
              childCount: controller.products.length,
            ),
          ),
        ));
  }
}
