import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/model/puyo_piece.dart';

import '../model/puyo_field.dart';
import '../sprite_painter.dart';

/// ぷよ
class PuyoWidget extends StatelessWidget {
  const PuyoWidget({
    super.key,
    required this.puyoPiece,
    required this.size,
    this.opacity = 1.0,
  }) : super();

  final PuyoPiece puyoPiece;
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
          painter: SpritePainter(puyoPiece.getSpriteSourceRect()),
        ),
      ),
    );
  }
}
