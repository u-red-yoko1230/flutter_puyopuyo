import '../game_settings.dart';
import '../model/field_coordinate.dart';

/// ゲームユーティリティクラス
class GameUtility {
  GameUtility._() {
    throw AssertionError("private Constructor");
  }

  /// 位置情報をフィールド座標リストへ変換
  static List<FieldCoordinate> getPositionToFieldCoordinate(double positionX, double positionY, bool isAxis) {
    // 結果リスト
    List<FieldCoordinate> resultList = [];

    // X座標(横位置)FROM
    int xCoordinateFr = (positionX / GameSettings.numOfMoveSteps).floor();
    // X座標(横位置)TO
    int xCoordinateTo = (positionY / GameSettings.numOfMoveSteps).ceil();
    // Y座標(縦位置)
    int yCoordinate = (GameSettings.mainFieldYSize - 1) - (positionY / GameSettings.numOfMoveSteps).ceil();

    // 結果リスト設定
    resultList.add(FieldCoordinate.collisionCheck(x: xCoordinateFr, y: yCoordinate, isAxis: isAxis));
    if (xCoordinateFr != xCoordinateTo) resultList.add(FieldCoordinate.collisionCheck(x: xCoordinateTo, y: yCoordinate, isAxis: isAxis));

    // 結果
    return resultList;
  }
}
