import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_coordinate.freezed.dart';

/// フィールド座標
@freezed
class FieldCoordinate with _$FieldCoordinate {
  const FieldCoordinate._();
  const factory FieldCoordinate({
    /// 座標 : X
    required int x,

    /// 座標 : Y
    required int y,
  }) = _FieldCoordinate;

  const factory FieldCoordinate.collisionCheck({
    /// 座標 : X
    required int x,

    /// 座標 : Y
    required int y,

    /// 軸ぷよである
    @Default(false) bool isAxis,
  }) = _FieldCoordinateCollisionCheck;
}

extension FieldCoordinateExtension on FieldCoordinate {
  bool getIsAxis() {
    return when((x, y) => false, collisionCheck: (x, y, isAxis) => isAxis);
  }
}
