import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/signin/signin_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/widgets/custom_button.dart';
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
          TextFormField(
            onChanged: controller.setEmail,
            validator: (value) => controller.validateEmail(value),
            decoration: Styles.buildInputDecoration('Nhập email của bạn'),
          ),
          const SizedBox(height: TSizes.spacing16),
          Obx(
            () => TextFormField(
              onChanged: controller.setPassword,
              obscureText: controller.showPassword.value,
              validator: (value) => controller.validatePassword(value),
              decoration: Styles.buildInputDecoration('Nhập mật khẩu',
                  onTap: controller.visibilityPassword,
                  isShow: controller.showPassword.value),
            ),
          ),
          const SizedBox(height: TSizes.spacing16),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                TTexts.forgotPassword,
                style: TextStyle(color: TColors.grayPrimary),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spacing16),
          CustomButton(text: TTexts.signInName, onPressed: controller.onSubmit),
          const SizedBox(height: TSizes.spacing32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/icons/google.png'),
              Image.asset('assets/icons/facebook.png'),
              Image.asset('assets/icons/twitter.png')
            ],
          ),
          const SizedBox(height: TSizes.spacing32),
          const FormDivider(
            text: TTexts.questionNoAccount,
            actionText: TTexts.createAccount,
          ),
        ],
      ),
    );
  }

  /* InputDecoration _buildInputDecoration(String labelText,
      {void Function()? onTap, bool? isShow}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
          vertical: TSizes.spacing16, horizontal: TSizes.spacing20),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.greenPrimary, width: 0.5),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.graySecondary),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      hintText: labelText,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
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
  } */
}
