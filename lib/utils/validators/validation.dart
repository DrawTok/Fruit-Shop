
import 'package:fruitshop/utils/constants/constant.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';

class TValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    if (!password.contains(uppercaseRegExp)) {
      return 'Password must contain at least one uppercase letter.';
    }

    /* if (!password.contains(specialRegExp)) {
      return 'Password must contain at least one special character';
    } */

    return null;
  }

  static String checkPasswordStrength(String password) {
    if (passwordStrongRegExp.hasMatch(password)) {
      return TTexts.strongPassword;
    }
    if (passwordMediumRegExp.hasMatch(password)) {
      return TTexts.mediumPassword;
    }
    return TTexts.weakPassword;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }

    if (!phoneRegExp.hasMatch(phone)) {
      return 'Invalid phone number format (10 digits required)';
    }
    return null;
  }
}
