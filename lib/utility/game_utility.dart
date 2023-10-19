import '../game_settings.dart';
import '../model/field_coordinate.dart';
import '../model/puyo.dart';

/// ゲームユーティリティクラス
class GameUtility {
  GameUtility._() {
    throw AssertionError("private Constructor");
  }

  /// ぷよ連結処理
  static void connection(
    List<List<PuyoField>> fieldList, {
    List<PuyoConnection>? puyoConnectionList,
  }) {
    // チェック済みリスト
    List<List<bool>> checkedList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => false));

    // ぷよ連結情報リスト初期化
    puyoConnectionList = puyoConnectionList ?? [];

    /// ぷよ連結チェック処理
    bool check(
      int x,
      int y,
      PuyoConnection puyoConnection,
    ) {
      // 連結対象フラグ
      bool connectionFlg = false;
      // フィールド範囲内チェック
      if (x >= 0 && x < GameSettings.mainFieldXSize && y >= 0 && y < GameSettings.mainFieldYSize) {
        // 連結チェック
        if (puyoConnection.puyoType == fieldList[x][y].puyoType) {
          // 連結チェック対象範囲内の場合
          if (y < (GameSettings.mainFieldYSize - GameSettings.hideMainFieldYSize)) {
            // 連結対象フラグ
            connectionFlg = true;
          }
        }
        // 精査済みチェック
        if (!checkedList[x][y]) {
          // 連結対象の場合
          if (connectionFlg) {
            checkedList[x][y] = true;

            // 基点及び隣接するぷよリスト追加
            puyoConnection.baseAndAdjacentPuyoList.add(FieldCoordinate(x: x, y: y));
            // ぷよ連結チェック処理 : 上右下左の順でチェックを行う
            // 上方向精査 x+0 y+1
            // 右方向精査 x+1 y+0
            // 下方向精査 x+0 y-1
            // 左方向精査 x-1 y+0
            fieldList[x][y] = fieldList[x][y].copyWith(
              connectedTop: check(x, y + 1, puyoConnection),
              connectedRight: check(x + 1, y, puyoConnection),
              connectedBottom: check(x, y - 1, puyoConnection),
              connectedLeft: check(x - 1, y, puyoConnection),
            );
          }
          // おじゃま系ぷよの場合
          else if (GameSettings.puyoOjamaList.contains(fieldList[x][y].puyoType)) {
            checkedList[x][y] = true;

            // 基点及び隣接するおじゃまぷよリスト追加
            puyoConnection.baseAndAdjacentOjamaList.add(FieldCoordinate(x: x, y: y));
          }
        }
      }
      return connectionFlg;
    }

    // チェック開始
    for (MapEntry<int, List<bool>> x in checkedList.asMap().entries) {
      for (MapEntry<int, bool> y in x.value.asMap().entries) {
        // 精査済みチェック
        if (!checkedList[x.key][y.key]) {
          checkedList[x.key][y.key] = true;
          // 精査対象ぷよ判定
          if (GameSettings.puyoColorList.contains(fieldList[x.key][y.key].puyoType)) {
            // 基点ぷよ連結情報設定
            puyoConnectionList.add(
              PuyoConnection(
                puyoType: fieldList[x.key][y.key].puyoType,
                baseAndAdjacentPuyoList: [FieldCoordinate(x: x.key, y: y.key)],
                baseAndAdjacentOjamaList: [],
              ),
            );
            // ぷよ連結チェック処理 : 上右下左の順でチェックを行う
            // 上方向精査 x+0 y+1
            // 右方向精査 x+1 y+0
            // 下方向精査 x+0 y-1
            // 左方向精査 x-1 y+0
            fieldList[x.key][y.key] = fieldList[x.key][y.key].copyWith(
              connectedTop: check(x.key, y.key + 1, puyoConnectionList.last),
              connectedRight: check(x.key + 1, y.key, puyoConnectionList.last),
              connectedBottom: check(x.key, y.key - 1, puyoConnectionList.last),
              connectedLeft: check(x.key - 1, y.key, puyoConnectionList.last),
            );
          }
        }
      }
    }
  }

  /// 位置情報をフィールド座標リストへ変換
  static List<FieldCoordinate> getPositionToFieldCoordinate(double positionX, double positionY, bool isAxis) {
    // 結果リスト
    List<FieldCoordinate> resultList = [];

    // X座標(横位置)FROM
    int xCoordinateFr = (positionX / GameSettings.numOfMoveSteps).floor();
    // X座標(横位置)TO
    int xCoordinateTo = (positionX / GameSettings.numOfMoveSteps).ceil();
    // Y座標(縦位置)
    int yCoordinate = (GameSettings.mainFieldYSize - 1) - (positionY / GameSettings.numOfMoveSteps).ceil();

    // 結果リスト設定
    resultList.add(FieldCoordinate.collisionCheck(x: xCoordinateFr, y: yCoordinate, isAxis: isAxis));
    if (xCoordinateFr != xCoordinateTo) resultList.add(FieldCoordinate.collisionCheck(x: xCoordinateTo, y: yCoordinate, isAxis: isAxis));

    // 結果
    return resultList;
  }
}
