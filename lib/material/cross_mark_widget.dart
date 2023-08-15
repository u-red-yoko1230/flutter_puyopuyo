import 'package:flutter/material.dart';

import '../app_settings.dart';
import '../sprite_painter.dart';

/// クロスマーク
class CrossMarkWidget extends StatelessWidget {
  const CrossMarkWidget({
    super.key,
    required this.size,
    this.opacity = 1.0,
  }) : super();

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: SpritePainter(AppSettings.spriteSourceRect["cross_mark.png"]!),
        ),
      ),
    );
  }
}
