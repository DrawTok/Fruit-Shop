import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/colors.dart';

class TLoading extends StatelessWidget {

  final double? size;

  const TLoading({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
                color: TColors.greenPrimary,
                backgroundColor: Colors.white,
              ),
        ));
  }
}
