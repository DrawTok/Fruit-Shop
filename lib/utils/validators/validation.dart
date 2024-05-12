import 'package:fruitshop/utils/constants/constant.dart';
import 'package:fruitshop/utils/constants/text_strings.dart';

class TValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }

    if (!nameRegExp.hasMatch(name)) {
      return 'The name must be at least 8 characters and no more than 50 characters.';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return TTexts.requiredEmail;
    }

    if (!emailRegExp.hasMatch(email)) {
      return TTexts.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return TTexts.requiredPassword;
    }
    if (password.length < 8) {
      return TTexts.invalidPassword;
    }

    if (!password.contains(uppercaseRegExp)) {
      return TTexts.uppercasePassword;
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
