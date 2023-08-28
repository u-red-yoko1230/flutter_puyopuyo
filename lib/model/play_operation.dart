import '../game_settings.dart';

class PlayOperation {
  PlayOperation({
    this.axisPositionX = GameSettings.numOfMoveSteps * 2,
    this.axisPositionY = GameSettings.numOfMoveSteps + (GameSettings.numOfMoveSteps / 2.0),
  });

  /// 軸:座標:X
  double axisPositionX;

  /// 軸:座標:Y
  double axisPositionY;
}
