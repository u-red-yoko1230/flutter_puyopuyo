import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/puyo_shape_type.dart';
import '../enum/puyo_type.dart';

part 'drop_set.freezed.dart';

/// 配ぷよ(ドロップセット)
@freezed
class DropSet with _$DropSet {
  const DropSet._();
  const factory DropSet({
    /// ぷよ形種類
    @Default(PuyoShapeType.I) PuyoShapeType puyoShapeType,
    /// ぷよ種類 : 軸
    @Default(PuyoType.n) PuyoType puyoTypeAxis,
    /// ぷよ種類 : 子
    @Default(PuyoType.n) PuyoType puyoTypeChild,
  }) = _DropSet;
}

extension DropSetExtension on DropSet {
  /// ぷよ種類の取得(軸)
  PuyoType getPuyoTypeAxis() {
      return puyoTypeAxis;
  }
  /// ぷよ種類の取得(子)
  PuyoType getPuyoTypeChild() {
      return puyoTypeChild;
  }
}
