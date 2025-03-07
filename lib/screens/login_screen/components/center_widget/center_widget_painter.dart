import 'package:flutter/material.dart';
import 'dart:ui';

class CenterWidgetPainter extends CustomPainter {
  final Path path;

  const CenterWidgetPainter({required this.path});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10 
      ..color = Colors.black26
      ..imageFilter = ImageFilter.blur(sigmaX: 2, sigmaY: 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CenterWidgetPainter oldDelegate) => false;
}