import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruitshop/http/http_client.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
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

  String? validatePassword(String? password) =>
      TValidator.validatePassword(password);

  void onSubmit() async {
    final isValid = formKeySignIn.currentState!.validate();

    if (!isValid) {
      return;
    }

    TDeviceUtility.hideKeyBoard(Get.context!);

    var response = await THttpHelper.post('users/login', {
      "username": email.toLowerCase(),
      "password": password,
    });
    if (response['code'] == 1003) {
      saveToken(response['data']['token']);
      //HelperFunctions.showSnackBar(response, 'Thành công');
      //Get.to(const OTPScreen(), arguments: email);
    } else {
      //HelperFunctions.showSnackBar(response, 'Thất bại');
    }
  }

  void navigateSignUp() {
    /* if (Get.isRegistered<SignUpController>()) {
      Get.back();
    } else {
      Get.toNamed('/signUp');
    } */
  }

  void saveToken(String token) {
    TLocalStorage localStorage = TLocalStorage();
    localStorage.saveData('token', token);
  }
}
