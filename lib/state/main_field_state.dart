import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/field_coordinate.dart';
import '../model/puyo.dart';

/// メインフィールド状態プロバイダ
final mainFieldStateProvider = ChangeNotifierProvider((ref) => MainFieldState(ref));

/// メインフィールド状態
class MainFieldState extends ChangeNotifier {
  MainFieldState(this.ref);

  final Ref ref;

  /// メインフィールドリスト
  List<List<Puyo>> mainFieldList = [];

  /// リセット
  void reset() {
    /// メインフィールドリスト設定
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const Puyo()));

    // 反映
    notifyListeners();
  }

  /// 衝突チェック
  bool collisionCheck(List<FieldCoordinate> fieldCoordinateList) {
    // 衝突判定
    for (FieldCoordinate fieldCoordinate in fieldCoordinateList) {
      // フィールドの範囲外に存在する場合
      if (fieldCoordinate.x < 0 || fieldCoordinate.x >= GameSettings.mainFieldXSize || fieldCoordinate.y < 0 || fieldCoordinate.y >= GameSettings.mainFieldYSize) {
        return true;
      }
      // 軸ぷよは１４段目に移動できない
      else if (fieldCoordinate.getIsAxis() && fieldCoordinate.y > (GameSettings.mainFieldYSize - GameSettings.hideMainFieldYSize)) {
        return true;
      }
      // 指定された座標にぷよが存在しないこと
      else if (mainFieldList[fieldCoordinate.x][fieldCoordinate.y].puyoType != PuyoType.n) {
        return true;
      }
    }

    return false;
  }

  /// セット
  void set(PuyoType puyoType) {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => Puyo.field(puyoType: puyoType)));
    notifyListeners();
  }

  /// テスト
  Future<void> test() async {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const Puyo.field(puyoType: PuyoType.r)));
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 5000));
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const Puyo.field(puyoType: PuyoType.g)));
    notifyListeners();
  }
}
