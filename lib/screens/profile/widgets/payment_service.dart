import 'package:flutter/material.dart';
import 'package:fruitshop/screens/profile/layout/wallet.dart';
import 'package:fruitshop/screens/profile/widgets/payment_method.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:fruitshop/widgets/custom_button.dart';
import 'package:get/route_manager.dart';

class PaymentService extends StatelessWidget {
  const PaymentService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(title: TTexts.payment),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.spacing20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.wallet, style: Styles.title1),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              const Wallet(url: 'assets/icons/momo.png', label: 'MoMo'),
              const Spacer(),
              CustomButton(
                  text: TTexts.paymentMethod,
                  onPressed: () {
                    Get.to(const PaymentMethod());
                  }),
            ],
          ),
        ),
    );
  }
}
