import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadius10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
