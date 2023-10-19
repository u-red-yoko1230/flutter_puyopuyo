import 'dart:ui';
import 'package:flutter_puyopuyo/model/field_coordinate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_settings.dart';
import '../enum/puyo_type.dart';

part 'puyo.freezed.dart';

/// 組ぷよ
@Freezed(makeCollectionsUnmodifiable: false)
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

  factory Puyo.connection({
    /// ぷよ種類
    @Default(PuyoType.n) PuyoType puyoType,

    /// 基点及び隣接するぷよリスト
    @Default([]) List<FieldCoordinate> baseAndAdjacentPuyoList,

    /// 基点及び隣接するおじゃまぷよリスト初期化
    @Default([]) List<FieldCoordinate> baseAndAdjacentOjamaList,
  }) = PuyoConnection;
}

extension PuyoExtension on Puyo {
  /// 落下状態の取得
  bool getJustDropped() {
    return when(
      (puyoType) {
        return false;
      },
      field: (puyoType, justDropped, connectedTop, connectedRight, connectedBottom, connectedLeft) {
        return justDropped;
      },
      connection: (puyoType, baseAndAdjacentPuyoList, baseAndAdjacentOjamaList) {
        return false;
      },
    );
  }

  /// スプライト矩形座標の取得
  Rect getSpriteSourceRect() {
    return when(
      (puyoType) {
        return AppSettings.spriteSourceRect["puyo_${puyoType.name}_0000.png"]!;
      },
      field: (puyoType, justDropped, connectedTop, connectedRight, connectedBottom, connectedLeft) {
        return AppSettings.spriteSourceRect["puyo_${puyoType.name}_${connectedTop ? '1' : '0'}${connectedRight ? '1' : '0'}${connectedBottom ? '1' : '0'}${connectedLeft ? '1' : '0'}.png"]!;
      },
      connection: (puyoType, baseAndAdjacentPuyoList, baseAndAdjacentOjamaList) {
        return AppSettings.spriteSourceRect["puyo_${puyoType.name}_0000.png"]!;
      },
    );
  }
}
