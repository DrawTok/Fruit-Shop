import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/cart/cart_controller.dart';
import 'package:fruitshop/placeholder/error/no_item.dart';
import 'package:fruitshop/placeholder/loading/loading.dart';
import 'package:fruitshop/screens/cart/widgets/item_cart.dart';
import 'package:fruitshop/screens/cart/widgets/order_detail.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/widgets/custom_button.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Giỏ hàng'),
          actions: [
            Obx(
              () => controller.products.isNotEmpty
                  ? TextButton(
                      onPressed: controller.handleEdit,
                      child: Text(
                        TTexts.edit,
                        style: TextStyle(color: TColors.greenPrimary),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.isTrue
            ? const TLoading()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.spacing16),
                child: Column(
                  children: [
                    buildEmptyOrListView(),
                    buildOrderDetail(),
                  ],
                ),
              )),
      ),
    );
  }

  Widget buildEmptyOrListView() {
    return Obx(
      () => controller.products.isEmpty
          ? const Expanded(child: NoItem())
          : Expanded(
              child: ListView.builder(
                key: ValueKey<bool>(controller.isEdit.value),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return ItemCart(
                    index: index,
                    isVisibleCheckBox: controller.isEdit.value,
                  );
                },
              ),
            ),
    );
  }

  Widget buildOrderDetail() {
    return Obx(
      () => Column(
        children: [
          if (controller.products.isNotEmpty) ...[
            OrderDetail(key: ValueKey<int>(controller.totalPayment.value)),
            CustomButton(
              text: controller.isEdit.isFalse
                  ? TTexts.createOrder
                  : TTexts.deleteItem,
              onPressed: controller.isEdit.isFalse
                  ? controller.handleRequiredInfo
                  : controller.onDeleteSelectedItem,
            ),
          ],
          const SizedBox(height: TSizes.sizeBoxHeight10),
        ],
      ),
    );
  }
}
