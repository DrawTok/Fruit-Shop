import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/controllers/signin/signin_controller.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/utils/constants/constant.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:fruitshop/utils/validators/validation.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final formKeySignUp = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  var showPassword = true.obs;
  var showConfirmPassword = true.obs;
  var isMinCharCount = false.obs;
  var isSpecialRequired = false.obs;
  var isStrength = ''.obs;

  void visibilityPassword() => showPassword.value = !showPassword.value;
  void visibilityConfirmPassword() =>
      showConfirmPassword.value = !showConfirmPassword.value;

  void setName(String value) => fullName = value;

  void setEmail(String value) => email = value;

  void setPassword(String value) {
    password = value;
    _verify(value);
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  String? checkLengthName(String? value) => TValidator.validateName(value);

  String? validateEmail(String? value) => TValidator.validateEmail(value);

  String? validatePassword(String? value) {
    _verify(value);
    return TValidator.validatePassword(value);
  }

  String? comparePassword(String? value) {
    if (password == confirmPassword) {
      return null;
    }
    return TTexts.notMatch;
  }

  void _verify(String? value) {
    isMinCharCount.value = (value != null && value.length >= 8) ? true : false;
    isSpecialRequired.value =
        value != null ? value.contains(uppercaseRegExp) : false;

    isStrength.value = TValidator.checkPasswordStrength(value ?? '');
  }

  void onSubmit() async {
    final isValid = formKeySignUp.currentState!.validate();
    if (!isValid) {
      return;
    }

    TDeviceUtility.hideKeyBoard(Get.context!);

    List<String> nameParts = fullName.split(" ");

    var response = await THttpHelper.post('user/register', {
      "email": email.toLowerCase(),
      "firstname": nameParts.first,
      "lastname": nameParts.last,
      "password": password,
    });

    if (response['_id'] != null) {
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.signUpSuccess);
    } else {
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.signUpFail);
    }
  }

  void navigateSignIn() {
    if (Get.isRegistered<SignInController>()) {
      Get.back();
    } else {
      Get.toNamed('/signIn');
    }
  }
}
