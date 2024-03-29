import 'package:flutter/material.dart';
import 'package:fruitshop/screens/home/widgets/app_bar.dart';
import 'package:fruitshop/screens/signin/widgets/form.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(title: TTexts.signInName),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing25),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/fruit_yeah.png',
                  height: 200,
                ),
                const SizedBox(height: TSizes.sizeBoxHeight20),
                Text('Chào mừng trở lại!'),
                const SizedBox(height: TSizes.sizeBoxHeight20),
                const SignInForm(),
                const SizedBox(height: TSizes.sizeBoxHeight50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
