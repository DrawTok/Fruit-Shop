import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';
import 'package:fruitshop/utils/devices/device_utility.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void showSnackBar(String title, String content) {
    Get.snackbar(title, content,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
            vertical: TDeviceUtility.getBottomNavigationBarHeight() - 20,
            horizontal: TSizes.spacing10),
        icon: const Icon(Icons.close),
        backgroundColor: TColors.graySecOpacity);
  }

  static bool checkToken() {
    TLocalStorage localStorage = TLocalStorage();
    Map<String, dynamic>? user = localStorage.readData('user');
    if (user != null) {
      bool isTokenExpired = JwtDecoder.isExpired(user['token']);
      return !isTokenExpired;
    }
    return false;
  }

  static int calcTotalAmount(int price, int quantity) {
    return price * quantity;
  }

  static int calcTotalPayment(
      {required int total, int coupons = 0, int deliveryCharges = 1000}) {
    int totalPayment = total - coupons + deliveryCharges;
    return totalPayment;
  }

  static String generateSignature(
      {required int amount,
      required String extraData,
      required String ipnUrl,
      required String orderId,
      required String orderInfo,
      required String redirectUrl,
      required String requestId,
      required String requestType}) {
    var secretKey = utf8.encode(dotenv.env['SECRET_KEY'].toString());
    var accessKey = dotenv.env['ACCESS_KEY'].toString();
    var partnerCode = dotenv.env['PARTNER_CODE'].toString();

    var signature = utf8.encode("accessKey=$accessKey&amount=$amount"
        "&extraData=$extraData&ipnUrl=$ipnUrl"
        "&orderId=$orderId&orderInfo=$orderInfo"
        "&partnerCode=$partnerCode&redirectUrl=$redirectUrl"
        "&requestId=$requestId&requestType=$requestType");
    var hMacSha256 = Hmac(sha256, secretKey);
    var digest = hMacSha256.convert(signature);
    return digest.toString();
  }
}
