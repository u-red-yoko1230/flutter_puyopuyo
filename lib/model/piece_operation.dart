import 'package:flutter_puyopuyo/enum/rotation_state_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../game_settings.dart';

part 'piece_operation.freezed.dart';

/// ピース(ツモ)操作
@freezed
class PieceOperation with _$PieceOperation {
    const PieceOperation._();
  const factory PieceOperation({
  /// 軸の位置 : X
  @Default(GameSettings.numOfMoveSteps * 2.0) double axisPositionX,

  /// 軸の位置 : Y
  @Default(GameSettings.numOfMoveSteps * 1.5) double axisPositionY,

  /// 回転状態種類
  @Default(RotationStateType.U) RotationStateType rotationStateType,

  /// 回転角度
  @Default(0.0) double rotationDegree,

  /// クイックターンフラグ
  @Default(false) bool quickTurnFlag,

  /// 接地時間
  @Default(0.0) double groundingTime,
  }) = _PieceOperation;
}
