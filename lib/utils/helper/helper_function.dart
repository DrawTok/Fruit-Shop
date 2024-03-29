import 'package:flutter/material.dart';
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
}
