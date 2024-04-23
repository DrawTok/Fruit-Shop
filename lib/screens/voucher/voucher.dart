import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/voucher/voucher_controller.dart';
import 'package:fruitshop/error/no_voucher.dart';
import 'package:fruitshop/screens/voucher/widgets/item_voucher.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    VoucherController controller = Get.put(VoucherController());

    return Scaffold(
      body: Obx(() => controller.vouchers.isEmpty
          ? const NoVoucher()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.spacing8, vertical: TSizes.spacing10),
              itemCount: controller.vouchers.length,
              itemBuilder: (_, index) => ItemVoucher(index: index))),
    );
  }
}
