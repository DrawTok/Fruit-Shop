import 'package:flutter/material.dart';
import 'package:fruitshop/screens/profile/layout/wallet.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text(TTexts.addMethod)),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.spacing20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.affiliatedBank, style: Styles.title1),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              const Wallet(url: 'assets/icons/vcb.png', label: 'Vietcombank'),
              const SizedBox(height: TSizes.sizeBoxHeight20),
              Text(TTexts.wallet, style: Styles.title1),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              const Wallet(url: 'assets/icons/momo.png', label: 'MoMo'),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              const Wallet(url: 'assets/icons/shopee.png', label: 'Shopee'),
              const SizedBox(height: TSizes.sizeBoxHeight20),
              Text(TTexts.credit, style: Styles.title1),
              const SizedBox(height: TSizes.sizeBoxHeight10),
              const Wallet(url: 'assets/images/payment.png', label: TTexts.credit),
            ],
          ),
        ),
      ),
    );
  }
}