import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruitshop/local_storage/storage_utility.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /* static void showSnackBar(Map<String, dynamic> response, String title) {
    Get.snackbar(
        title,
        UserCodes.getMessage(
          response['code'],
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
            vertical: TDeviceUtility.getBottomNavigationBarHeight() - 20,
            horizontal: TSizes.spacing10),
        icon: const Icon(Icons.close),
        backgroundColor: Colors.white);
  }*/

  static bool checkToken() {
    TLocalStorage localStorage = TLocalStorage();
    String? token = localStorage.readData('token');
    if (token != null) {
      return true;
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
