import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/profile/profile_controller.dart';
import 'package:fruitshop/placeholder/error/no_item.dart';
import 'package:fruitshop/placeholder/loading/voucher_skelton.dart';
import 'package:fruitshop/screens/profile/layout/purchase_item.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:get/get.dart';

class PurchaseHistory extends GetView<ProfileController> {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: 'Lịch sử mua hàng'),
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: VoucherSkelton(),
            );
          } else {
            return RefreshIndicator(
              color: TColors.greenPrimary,
              backgroundColor: Colors.white,
              onRefresh: () => controller.refresh(),
              child: controller.orders.isEmpty
                  ? const NoItem()
                  : ListView.builder(
                      itemCount: controller.orders.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(TSizes.spacing8),
                        child: PurchaseItem(
                            index: index, orderModel: controller.orders[index]),
                      ),
                    ),
            );
          }
        },
      ),
    );
  }
}
