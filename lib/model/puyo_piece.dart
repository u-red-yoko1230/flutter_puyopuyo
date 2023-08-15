import 'dart:ui';

import '../app_settings.dart';
import '../enum/puyo_type.dart';

/// ぷよ
class PuyoPiece {
  PuyoPiece({
    this.puyoType = PuyoType.n,
  });

  /// ぷよ種類
  PuyoType puyoType;

  /// スプライト矩形座標の取得
  Rect getSpriteSourceRect() {
    return AppSettings.spriteSourceRect["puyo_${puyoType.name}_0000.png"]!;
  }
}
