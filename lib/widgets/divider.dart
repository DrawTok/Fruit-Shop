import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class FormDivider extends StatelessWidget {
  final String text;
  const FormDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
            child: Divider(
          height: TSizes.dividerHeight,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.spacing10),
          child: Text(text),
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}
