import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/puyo_piece_type.dart';
import '../enum/puyo_type.dart';

part 'drop_set.freezed.dart';

/// 配ぷよ(ドロップセット)
/// drop set
@freezed
class DropSet with _$DropSet {
  const DropSet._();
  const factory DropSet({
    /// ぷよ形種類
    /// Puyo shape Type
    @Default(PuyoShapeType.I) PuyoShapeType puyoShapeType,
    /// ぷよ種類 : 軸
    /// Puyo shape Type
    @Default(PuyoType.n) PuyoType puyoTypeAxis,
    /// ぷよ種類 : 子
    /// Puyo shape Type
    @Default(PuyoType.n) PuyoType puyoTypeChild,
  }) = _DropSet;
}
