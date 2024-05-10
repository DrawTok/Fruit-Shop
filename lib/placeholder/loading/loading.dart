import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';

class TLoading extends StatelessWidget {
  const TLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: TColors.greenPrimary,
      backgroundColor: Colors.white,
    ));
  }
}
