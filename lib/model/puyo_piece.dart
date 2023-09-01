import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_settings.dart';
import '../enum/puyo_type.dart';

part 'puyo_piece.freezed.dart';

/// ぷよ
@freezed
class PuyoPiece with _$PuyoPiece {
  const PuyoPiece._();
  const factory PuyoPiece({
    /// ぷよ種類
    @Default(PuyoType.n) PuyoType puyoType,
  }) = _PuyoPiece;

  const factory PuyoPiece.field({
    /// ぷよ種類
    @Default(PuyoType.n) PuyoType puyoType,

    /// 落下状態
    @Default(false) bool justDropped,

    /// 結合：上
    @Default(false) bool connectedTop,

    /// 結合：右
    @Default(false) bool connectedRight,

    /// 結合：下
    @Default(false) bool connectedBottom,

    /// 結合：左
    @Default(false) bool connectedLeft,
  }) = PuyoField;
}

extension PuyoPieceExtension on PuyoPiece {
  /// スプライト矩形座標の取得
  Rect getSpriteSourceRect() {
    return when(
      (puyoType) {
        return AppSettings.spriteSourceRect["puyo_${puyoType.name}_0000.png"]!;
      },
      field: (puyoType, justDropped, connectedTop, connectedRight, connectedBottom, connectedLeft) {
        return AppSettings.spriteSourceRect["puyo_${puyoType.name}_${connectedTop ? '1' : '0'}${connectedRight ? '1' : '0'}${connectedBottom ? '1' : '0'}${connectedLeft ? '1' : '0'}.png"]!;
      },
    );
  }
}
