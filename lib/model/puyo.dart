import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_settings.dart';
import '../enum/puyo_type.dart';

part 'puyo.freezed.dart';

/// 組ぷよ
@freezed
class Puyo with _$Puyo {
  const Puyo._();
  const factory Puyo({
    /// ぷよ種類
    @Default(PuyoType.n) PuyoType puyoType,
  }) = _Puyo;

  const factory Puyo.field({
    /// ぷよ種類
    @Default(PuyoType.n) PuyoType puyoType,

    /// 落下したばかり
    @Default(false) bool justDropped,

    /// 連結 : 上
    @Default(false) bool connectedTop,

    /// 連結 : 右
    @Default(false) bool connectedRight,

    /// 連結 : 右
    @Default(false) bool connectedBottom,

    /// 連結 : 左
    @Default(false) bool connectedLeft,
  }) = PuyoField;
}

extension PuyoExtension on Puyo {
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
