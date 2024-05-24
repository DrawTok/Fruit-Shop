import 'package:flutter/material.dart';
import 'package:fruitshop/widgets/app_bar.dart';
import 'package:fruitshop/screens/signup/widgets/form.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/constants/styles.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TAppBar(title: TTexts.signUpName),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing24),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/fruit_yeah.png',
                height: 200,
              ),
              const SizedBox(height: TSizes.sizeBoxHeight20),
              Text(TTexts.welcomeBack.toUpperCase(), style: Styles.heading1),
              const SizedBox(height: TSizes.sizeBoxHeight20),
              const SignUpForm(),
              const SizedBox(height: TSizes.sizeBoxHeight50),
            ],
          ),
        ),
      ),
    );
  }
}
