import 'package:flutter/material.dart';
import 'package:fruitshop/controllers/signup/signup_controller.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/constants/styles.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/widgets/custom_button.dart';
import 'package:fruitshop/widgets/divider.dart';
import 'package:get/get.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeySignUp,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            onChanged: controller.setEmail,
            validator: (value) => controller.validateEmail(value),
            decoration: Styles.buildInputDecoration('Nhập email của bạn'),
          ),
          const SizedBox(height: TSizes.spacing16),
          TextFormField(
            onChanged: controller.setName,
            validator: (value) => controller.checkLengthName(value),
            decoration: Styles.buildInputDecoration('Họ tên'),
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
          Obx(
            () => TextFormField(
              onChanged: controller.setConfirmPassword,
              obscureText: controller.showConfirmPassword.value,
              validator: (value) => controller.comparePassword(value),
              decoration: Styles.buildInputDecoration('Nhập lại mật khẩu',
                  onTap: controller.visibilityConfirmPassword,
                  isShow: controller.showConfirmPassword.value),
            ),
          ),
          const SizedBox(height: TSizes.spacing16),
          CustomButton(
              text: TTexts.signUpName,
              onPressed: controller.onSubmit,
              bgColor: TColors.greenPrimary),
          const SizedBox(height: TSizes.spacing32),
          const FormDivider(
            text: TTexts.questionHaveAccount,
            actionText: TTexts.signInName,
          ),
        ],
      ),
    );
  }
}
