import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/voucher/voucher_controller.dart';
import 'package:fruitshop/models/voucher_model.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:fruitshop/widgets/dotted_initial.dart';
import 'package:fruitshop/widgets/dotted_middle.dart';
import 'package:fruitshop/widgets/size_cut_design.dart';
import 'package:get/get.dart';

class ItemVoucher extends GetView<VoucherController> {
  final int index;
  final VoucherModel voucherModel;

  const ItemVoucher(
      {super.key, required this.index, required this.voucherModel});

  @override
  Widget build(BuildContext context) {
    bool isExpired = voucherModel.isExpired();
    var percentage = voucherModel.percentage;
    var code = voucherModel.code;
    var startDate = TFormatter.formatDate(voucherModel.startDate);
    var endDate = TFormatter.formatDate(voucherModel.endDate);
    String image = isExpired ? 'assets/icons/fruit_yeah_op.png' : 'assets/icons/fruit_yeah.png';

    return GestureDetector(
      onTap: () {
        isExpired ? () {} : controller.handleUseCoupons(index);
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: isExpired ? TColors.graySecondary : TColors.greenPrimary,
              borderRadius: BorderRadius.circular(TSizes.borderRadius8)),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(image, height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CODE: $code", style: Styles.title1White),
                      Text('Giảm $percentage%', style: Styles.title2White),
                      Text('$startDate - $endDate',
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(TSizes.borderRadius4),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(TSizes.borderRadius8),
                        border: Border.all(color: Colors.white)),
                    child: const Text('Sử dụng',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              CustomPaint(
                painter: SizeCutsDesign(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              CustomPaint(
                painter: DottedInitialPath(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              CustomPaint(
                painter: DottedMiddlePath(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
            ],
          )),
    );
  }
}
