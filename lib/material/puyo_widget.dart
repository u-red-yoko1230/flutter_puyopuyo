import 'package:flutter/material.dart';

import '../model/puyo_field.dart';
import '../sprite_painter.dart';

/// ぷよ
class PuyoWidget extends StatelessWidget {
  const PuyoWidget({
    super.key,
    required this.puyoField,
    required this.size,
    this.opacity = 1.0,
  }) : super();

  final PuyoField puyoField;
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
          painter: SpritePainter(puyoField.getSpriteSourceRect()),
        ),
      ),
    );
  }
}
