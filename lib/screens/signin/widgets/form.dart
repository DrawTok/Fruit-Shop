import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/signin/signin_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/constant.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/widgets/divider.dart';
import 'package:get/get.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeySignIn,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                vertical: TSizes.spacing8, horizontal: TSizes.spacing10),
            child: Row(
              children: [Text('Email '), textRequired],
            ),
          ),
          TextFormField(
            onChanged: controller.setEmail,
            validator: (value) => controller.validateEmail(value),
            decoration: _buildInputDecoration('Nhập email của bạn'),
          ),
          const SizedBox(height: TSizes.spaceBtwInputField),
          const Padding(
            padding: EdgeInsets.symmetric(
                vertical: TSizes.spacing8, horizontal: TSizes.spacing10),
            child: Row(
              children: [Text('Mật khẩu '), textRequired],
            ),
          ),
          Obx(
            () => TextFormField(
              onChanged: controller.setPassword,
              obscureText: controller.showPassword.value,
              validator: (value) => controller.validatePassword(value),
              decoration: _buildInputDecoration('Nhập mật khẩu',
                  onTap: controller.visibilityPassword,
                  isShow: controller.showPassword.value),
            ),
          ),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                TTexts.forgotPassword,
                style: TextStyle(color: TColors.greenPrimary),
              ),
            ),
          ),
          const SizedBox(height: TSizes.sizeBoxHeight10),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.greenPrimary,
                    foregroundColor: Colors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TTexts.signInName),
                  ],
                ),
                onPressed: () => controller.onSubmit()),
          ),
          const SizedBox(height: TSizes.spacing20),
          const SizedBox(height: TSizes.spacing20),
          const FormDivider(text: TTexts.questionNoAccount),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/icons/google.png'),
              Image.asset('assets/icons/facebook.png'),
              Image.asset('assets/icons/twitter.png')
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String labelText,
      {void Function()? onTap, bool? isShow}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
          vertical: TSizes.spacing10, horizontal: TSizes.spacing20),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.greenPrimary, width: 0.5),
        borderRadius: BorderRadius.circular(TSizes.borderRadius999),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.graySecondary),
        borderRadius: BorderRadius.circular(TSizes.borderRadius999),
      ),
      hintText: labelText,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius999),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius999),
      ),
      /* errorStyle: Styles.styleErrorText,
      hintStyle: Styles.styleText14, */

      suffixIcon: onTap != null
          ? InkWell(
              onTap: onTap,
              child: Icon(isShow!
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined))
          : null,
    );
  }
}
