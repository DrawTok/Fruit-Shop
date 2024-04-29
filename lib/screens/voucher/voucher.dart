import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/voucher/voucher_controller.dart';
import 'package:fruitshop/placeholder/error/no_voucher.dart';
import 'package:fruitshop/placeholder/loading/voucher_skelton.dart';
import 'package:fruitshop/screens/voucher/widgets/item_voucher.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    VoucherController controller = Get.put(VoucherController());

    return Scaffold(
        appBar: AppBar(title: const Text('Ưu đãi')),
        body: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return const Center(
                child: VoucherSkelton(),
              );
            } else {
              return controller.vouchers.isEmpty
                  ? const NoVoucher()
                  : ListView.builder(
                      itemCount: controller.vouchers.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(TSizes.spacing8),
                        child: ItemVoucher(index: index),
                      ),
                    );
            }
          },
        ));
  }
}
