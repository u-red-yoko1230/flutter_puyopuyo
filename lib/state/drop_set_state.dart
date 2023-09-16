import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/character_type.dart';
import '../enum/num_of_colors_type.dart';
import '../enum/puyo_shape_type.dart';
import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/drop_set.dart';

/// 配ぷよ(ドロップセット)リスト状態
class DropSetState extends ChangeNotifier {
  DropSetState(this.ref);

  final Ref ref;

  /// 配ぷよ(ドロップセット)リスト
  List<DropSet> dropSetList = [];

  /// 初期化
  void initialize() {
    /// 配ぷよ(ドロップセット)リスト設定
    dropSetList = generateDropSetList(
      puyoShapeList: getPuyoShapeList(CharacterType.tsuArle),
      puyoColorList: getPuyoColorList(NumOfColorsType.four),
    );

    // 反映
    notifyListeners();
  }

  /// 配ぷよ(ドロップセット)リスト生成
  List<DropSet> generateDropSetList({
    required List<PuyoShapeType> puyoShapeList,
    required List<PuyoType> puyoColorList,
  }) {
    // カラーリストインデックス
    int colorListIndex = 0;

    // 配ぷよ(ドロップセット)生成リスト
    List<DropSet> genDropSetList = [];

    // 手数分 - 生成処理
    for (int i = 0; i < GameSettings.numOfMovesPerLoop; i++) {
      // ぷよ形状
      PuyoShapeType puyoShapeType = puyoShapeList[i % puyoShapeList.length];
      // ぷよカラー(軸)
      PuyoType puyoTypeAxis = puyoColorList[colorListIndex];
      PuyoType puyoTypeChild = puyoColorList[colorListIndex + 1];

      // 配ぷよ(ドロップセット)生成リスト追加
      genDropSetList.add(DropSet(
        puyoShapeType: puyoShapeType,
        puyoTypeAxis: puyoTypeAxis,
        puyoTypeChild: puyoTypeChild,
      ));

      // カラーリストインデックスカウント
      colorListIndex += 2;
    }

    return genDropSetList;
  }

  /// ぷよ形状リスト取得
  List<PuyoShapeType> getPuyoShapeList(CharacterType characterType) {
    return characterType.puyoShapeList.toList();
  }

  /// ぷよ配色リスト取得
  List<PuyoType> getPuyoColorList(NumOfColorsType numOfColorsType) {
    // 基本色リストの取得
    List<PuyoType> puyoColorList = GameSettings.puyoColorList.toList();
    // 基本色リストのシャッフル
    puyoColorList.shuffle();

    // 手数 * 2 の色リストを設定
    int length = GameSettings.numOfMovesPerLoop * 2;
    // 配ぷよ(ドロップセット)用の色リスト（３～５）
    List<PuyoType> dropSet3ColorsList = List.generate(length, (index) => puyoColorList.take(3).toList()[index % 3]);
    List<PuyoType> dropSet4ColorsList = List.generate(length, (index) => puyoColorList.take(4).toList()[index % 4]);
    List<PuyoType> dropSet5ColorsList = List.generate(length, (index) => puyoColorList.take(5).toList()[index % 5]);
    // 色リストのシャッフル
    dropSet3ColorsList.shuffle();
    dropSet4ColorsList.shuffle();
    dropSet5ColorsList.shuffle();

    // 初手制限設定
    // ４色リストの上書き
    dropSet4ColorsList[0] = dropSet3ColorsList[0];
    dropSet4ColorsList[1] = dropSet3ColorsList[1];
    dropSet4ColorsList[2] = dropSet3ColorsList[2];
    dropSet4ColorsList[3] = dropSet3ColorsList[3];
    // ５色リストの上書き
    dropSet5ColorsList[0] = dropSet4ColorsList[0];
    dropSet5ColorsList[1] = dropSet4ColorsList[1];
    dropSet5ColorsList[2] = dropSet4ColorsList[2];
    dropSet5ColorsList[3] = dropSet4ColorsList[3];
    dropSet5ColorsList[4] = dropSet4ColorsList[4];
    dropSet5ColorsList[5] = dropSet4ColorsList[5];
    dropSet5ColorsList[6] = dropSet4ColorsList[6];
    dropSet5ColorsList[7] = dropSet4ColorsList[7];

    // 色設定
    switch (numOfColorsType) {
      case NumOfColorsType.three:
        return dropSet3ColorsList;
      case NumOfColorsType.four:
        return dropSet4ColorsList;
      case NumOfColorsType.five:
        return dropSet5ColorsList;
    }
  }
}
