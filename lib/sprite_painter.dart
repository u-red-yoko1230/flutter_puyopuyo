import 'package:flutter/material.dart';

import '../main.dart' as main;

/// スプライトペインター
class SpritePainter extends CustomPainter {
  const SpritePainter(this.src);

  final Rect src;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..filterQuality = FilterQuality.low;
    final dst = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawImageRect(main.image, src, dst, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
