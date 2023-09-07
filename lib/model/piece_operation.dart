import 'package:flutter_puyopuyo/enum/rotation_state_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../game_settings.dart';

part 'piece_operation.freezed.dart';

/// ピース(ツモ)操作
/// Piece operation
@freezed
class PieceOperation with _$PieceOperation {
    const PieceOperation._();
  const factory PieceOperation({
  /// 軸の位置 : X
  /// Axis position : X
  @Default(GameSettings.numOfMoveSteps * 2.0) double axisPositionX,

  /// 軸の位置 : Y
  /// Axis position : Y
  @Default(GameSettings.numOfMoveSteps * 1.5) double axisPositionY,

  /// 回転状態種類
  /// Rotation state type
  @Default(RotationStateType.U) RotationStateType rotationStateType,

  /// 回転角度
  /// Rotation degree
  @Default(0.0) double rotationDegree,

  /// クイックターンフラグ
  /// quick-turn flag
  @Default(false) bool quickTurnFlag,

  /// 接地時間
  /// Grounding Time
  @Default(0.0) double groundingTime,
  }) = _PieceOperation;
}
