import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/voucher/voucher_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/formatters/formatter.dart';
import 'package:get/get.dart';

class ItemVoucher extends GetView<VoucherController> {
  final int index;

  const ItemVoucher({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var percentage = controller.vouchers[index].percentage;
    var startDate = TFormatter.formatDate(controller.vouchers[index].startDate);
    var endDate = TFormatter.formatDate(controller.vouchers[index].endDate);

    return GestureDetector(
      onTap: () {
        controller.handleUseCoupons(index);
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: TColors.greenPrimary,
              borderRadius: BorderRadius.circular(TSizes.borderRadius8)),
          padding: const EdgeInsets.symmetric(vertical: TSizes.spacing8),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/fruit_yeah.png', height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Giảm $percentage%', style: Styles.title1White),
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
            ],
          )),
    );
  }
}

class SizeCutsDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;

    canvas.drawArc(
        Rect.fromCircle(center: Offset(0, h / 2), radius: 16),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.white);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(w, h / 2), radius: 16),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
