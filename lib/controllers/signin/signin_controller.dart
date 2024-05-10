import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:fruitshop/utils/helper/helper_function.dart';
import 'package:fruitshop/utils/validators/validation.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final formKeySignIn = GlobalKey<FormState>();

  String email = '';
  String password = '';
  var showPassword = true.obs;

  void visibilityPassword() => showPassword.value = !showPassword.value;

  void setEmail(String value) => email = value;

  void setPassword(String value) => password = value;

  String? validateEmail(String? value) => TValidator.validateEmail(value);

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return TTexts.requiredPassword;
    }
    return null;
  }

  void onSubmit() async {
    final isValid = formKeySignIn.currentState!.validate();

    if (!isValid) {
      return;
    }

    TDeviceUtility.hideKeyBoard(Get.context!);

    var response = await THttpHelper.post('user/login', {
      "email": email.toLowerCase(),
      "password": password,
    });

    if (response['_id'] != null) {
      saveToken(response);
      HelperFunctions.showSnackBar(TTexts.successful, TTexts.signInSuccess);
      Get.toNamed('/bottomBar');
    } else {
      HelperFunctions.showSnackBar(TTexts.fail, TTexts.signInFail);
    }
  }

  void navigateSignUp() {
    /* if (Get.isRegistered<SignUpController>()) {
      Get.back();
    } else {
      Get.toNamed('/signUp');
    } */
  }

  void saveToken(Map<String, dynamic> response) {
    TLocalStorage localStorage = TLocalStorage();
    localStorage.clearData();
    localStorage.saveData('user', response);
  }
}
