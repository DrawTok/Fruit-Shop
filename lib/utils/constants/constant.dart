import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

final nameRegExp = RegExp(r'^[a-zA-ZÀ-Ỹà-ỹ\s]{8,50}$');

final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
final uppercaseRegExp = RegExp(r'[A-Z]');
//final specialRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
final passwordMediumRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d@$!%*?&]{10,}$');
final passwordStrongRegExp = RegExp(
    r'^(?=.*[a-z])(?=(?:.*[A-Z]){2})(?=.*\d)(?=(?:.*[!@#$%^&*(),.?":{}|<>]){2})[A-Za-z\d!@#$%^&*(),.?":{}|<>]{12,}$');
final phoneRegExp = RegExp(r'^\d{10}$');

final otpInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(TSizes.borderRadius10),
    borderSide: BorderSide(color: TColors.blackPrimary),
  ),
);

const textRequired = Text(
  '*',
  style: TextStyle(color: Colors.red),
);
