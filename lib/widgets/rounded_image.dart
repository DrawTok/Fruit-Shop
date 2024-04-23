import 'package:flutter/material.dart';
import 'package:fruitshop/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.url,
    this.borderRadius = TSizes.borderRadius10,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.isNetworkImage = false,
  });

  final double? width, height;
  final String url;
  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(url)
                : AssetImage(url) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
