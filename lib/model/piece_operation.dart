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

    /// 軸の位置(移動) : X
    @Default(null) double? axisPositionMoveX,

    /// 軸の位置(移動) : Y
    @Default(null) double? axisPositionMoveY,

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

extension PieceOperationExtension on PieceOperation {
  /// 子の位置 : X
  double get childPositionX => getChildPositionX(rotationStateType, axisPositionX);

  /// 子の位置 : Y
  double get childPositionY => getChildPositionY(rotationStateType, axisPositionY);

  /// 子の位置(移動) : X
  double? get childPositionMoveX => axisPositionMoveX != null ? getChildPositionX(rotationStateType, axisPositionMoveX!) : null;

  /// 子の位置(移動) : Y
  double? get childPositionMoveY => axisPositionMoveY != null ? getChildPositionY(rotationStateType, axisPositionMoveY!) : null;

  /// 軸の位置(画面表示) : X
  double get axisPositionDisplayX => axisPositionMoveX ?? axisPositionX;

  /// 軸の位置(画面表示) : Y
  double get axisPositionDisplayY => axisPositionMoveY ?? axisPositionY;

  /// 子の位置(画面表示) : X
  double get childPositionDisplayX => childPositionMoveX ?? childPositionX;

  /// 子の位置(画面表示) : Y
  double get childPositionDisplayY => childPositionMoveY ?? childPositionY;

  /// 子の位置取得
  double getChildPositionX(RotationStateType rotationStateType, double axisPositionX) {
    return axisPositionX + (rotationStateType == RotationStateType.L ? (-GameSettings.numOfMoveSteps) : (rotationStateType == RotationStateType.R ? (GameSettings.numOfMoveSteps) : 0));
  }

  double getChildPositionY(RotationStateType rotationStateType, double axisPositionY) {
    return axisPositionY + (rotationStateType == RotationStateType.U ? (-GameSettings.numOfMoveSteps) : (rotationStateType == RotationStateType.D ? (GameSettings.numOfMoveSteps) : 0));
  }
}
