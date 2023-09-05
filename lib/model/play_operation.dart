import 'package:flutter_puyopuyo/enum/rotation_state_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../game_settings.dart';

part 'play_operation.freezed.dart';

/// プレイ操作
/// play operation
@freezed
class PlayOperation with _$PlayOperation {
    const PlayOperation._();
  const factory PlayOperation({
  /// 軸の位置 : X
  /// Axis position : X
  @Default(GameSettings.numOfMoveSteps * 2.0) double axisPositionX,

  /// 軸の位置 : Y
  /// Axis position : Y
  @Default(GameSettings.numOfMoveSteps * 1.5) double axisPositionY,

  /// 回転状態種類
  /// Rotation state type
  @Default(RotationStateType.U) RotationStateType rotationStateType,
  }) = _PlayOperation;
}
