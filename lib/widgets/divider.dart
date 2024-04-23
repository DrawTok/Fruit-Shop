import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/controllers/signin/signin_controller.dart';
import 'package:fruitshop/controllers/signup/signup_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class FormDivider extends StatelessWidget {
  final String text;
  final String actionText;
  const FormDivider({super.key, required this.text, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: text),
        TextSpan(
          text: ' $actionText',
          style: TextStyle(
              color: TColors.greenPrimary, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (actionText == TTexts.signInName) {
                if (Get.isRegistered<SignInController>()) {
                  Get.offAllNamed('/signIn');
                } else {
                  Get.toNamed('/signIn');
                }
              } else {
                if (Get.isRegistered<SignUpController>()) {
                  Get.offAllNamed('/signUp');
                } else {
                  Get.toNamed('/signUp');
                }
              }
            },
        )
      ]),
    );
  }
}
