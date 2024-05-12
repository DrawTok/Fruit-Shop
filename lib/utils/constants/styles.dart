import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class Styles {
  Styles._();

  static TextStyle heading1 =
      const TextStyle(fontSize: TSizes.textSize24, fontWeight: FontWeight.bold);

  static TextStyle title1 =
      const TextStyle(fontSize: TSizes.textSize16, fontWeight: FontWeight.bold);

  static TextStyle title1White = const TextStyle(
      fontSize: TSizes.textSize16,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle title2 =
      const TextStyle(fontSize: TSizes.textSize14, fontWeight: FontWeight.bold);

  static TextStyle title2White = const TextStyle(
      fontSize: TSizes.textSize14,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle textImage = TextStyle(
      fontSize: 30, color: TColors.greenPrimary, fontWeight: FontWeight.bold);

  static TextStyle headingWhite1 = const TextStyle(
      color: Colors.white,
      fontSize: TSizes.textSize24,
      fontWeight: FontWeight.bold);

  static InputDecoration buildInputDecoration(String labelText,
      {void Function()? onTap, bool? isShow}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
          vertical: TSizes.spacing16, horizontal: TSizes.spacing20),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.greenPrimary, width: 0.5),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TColors.graySecondary),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      hintText: labelText,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade800),
        borderRadius: BorderRadius.circular(TSizes.borderRadius10),
      ),
      /* errorStyle: Styles.styleErrorText,
      hintStyle: Styles.styleText14, */

      suffixIcon: onTap != null
          ? InkWell(
              onTap: onTap,
              child: Icon(isShow!
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined))
          : null,
    );
  }
}
