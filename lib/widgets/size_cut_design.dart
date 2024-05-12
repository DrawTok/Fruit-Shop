import 'package:flutter/material.dart';

class SizeCutsDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;

    List<Offset> positions = [
      Offset(0, h / 2),
      Offset(w, h / 2),
      Offset(w / 4, h),
      Offset(w / 4, 0),
      Offset(0, h),
      const Offset(0, 0),
    ];

    List<double> radii = [16, 16, 8, 8, 8, 8];

    for (int i = 0; i < positions.length; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: positions[i], radius: radii[i]),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}