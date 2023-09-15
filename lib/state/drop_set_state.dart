// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../app_settings.dart';
// import '../database/mobile.dart';
// import '../enum/game_mode_type.dart';
// import '../enum/game_nazo_setting_type.dart';
// import '../enum/game_puyo_type.dart';
// import '../enum/game_setting_type.dart';
// import '../enum/pick_color_type.dart';
// import '../enum/pick_overwritten_type.dart';
// import '../enum/puyo_piece_type.dart';
// import '../enum/puyo_type.dart';
// import '../enum/series_character_type.dart';
// import '../enum/user_pick_pair_type.dart';
// import '../game_utility.dart';
// import '../model/puyo_drop_set.dart';
// import 'game_nazo_setting_info_state.dart';
// import 'game_setting_info_state.dart';

// /// プロバイダー：ネクストフィールド情報
// final nextFieldProvider = ChangeNotifierProvider((ref) => NextFieldState(ref));

// /// プロバイダー：エディットネクストフィールド情報
// final editNextFieldProvider = ChangeNotifierProvider((ref) => NextFieldState(ref));

import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/enum/num_of_colors_type.dart';
import 'package:flutter_puyopuyo/enum/puyo_type.dart';
import 'package:flutter_puyopuyo/game_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/drop_set.dart';

/// 配ぷよ(ドロップセット)状態
/// Allocated Puyo (drop set) state
class DropSetState extends ChangeNotifier {
  DropSetState(this.ref);

  final Ref ref;

  /// 配ぷよ(ドロップセット)リスト
  List<DropSet> dropSetList = [];

  // /// 配色リスト
  // List<String> dealList = [];

  // /// 配ぷよリスト初期化 : とことんモードのみ
  // Future<void> initFreeDropSet({bool isGenDealSet = true, List<dynamic>? loadDealValue}) async {
  //   // ステート設定 : とことん
  //   final gameSettingInfoCurrent = ref.read(gameSettingInfoCurrentProvider);

  //   // ゲームモードの取得
  //   final GameModeType gameModeType = GameModeType.values.byName(gameSettingInfoCurrent.value![GameSettingType.mode]!);

  //   // ゲームぷよ種類設定
  //   final GamePuyoType gamePuyoType = gameModeType.getGamePuyoType();

  //   // 色設定の取得
  //   final PickColorType pickColorType = PickColorType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksColors]!);

  //   // キャラクターの取得
  //   final SeriesCharacterType seriesCharacterType = SeriesCharacterType.values.byName(gameSettingInfoCurrent.value![GameSettingType.seriesCharacter]!);

  //   // DealSetの取得（色）
  //   if (isGenDealSet) {
  //     if (loadDealValue != null) {
  //       dealList = loadDealValue.map((e) => e.toString()).toList();
  //     } else {
  //       dealList = await getDealtColorList();
  //     }
  //   }

  //   // ShapeSetの取得（形）
  //   List<PuyoPieceType> shapeList;
  //   if (gamePuyoType == GamePuyoType.tsu) {
  //     // 通モードの場合
  //     // DropSetの取得（形固定）
  //     shapeList = SeriesCharacterType.tsuArle.dropSet;
  //   } else {
  //     // フィーバーモードの場合
  //     // DropSetの取得
  //     shapeList = seriesCharacterType.dropSet;
  //   }

  //   // 配ぷよリスト生成＆設定
  //   dropSetList = GameUtility.generateDropSet(AppSettings.iMoves, shapeList: shapeList, dealList: dealList, pickColorType: pickColorType);

  //   // 反映
  //   notifyListeners();
  // }

  /// 初期化
  void initialize() {

  }

  // /// 配ぷよ(ドロップセット)リスト生成
  // List<DropSet> generateDropSetList(
  //   int moves, {
  //   required List<PuyoPieceType> shapeList,
  //   required List<String> dealList,
  //   PickColorType pickColorType = PickColorType.four,
  // }) {
  //   // 配ぷよリストへ設定
  //   // 色取得ポジション
  //   int iColorPos = 0;

  //   // ドロップセット - 生成
  //   List<PuyoDropSet> dropSetList = [];

  //   // 設定手数分(128) - 生成処理
  //   for (int i = 0; i < moves; i++) {
  //     PuyoPieceType puyoPiecesType = shapeList[i % shapeList.length];
  //     String dealParent = dealList[iColorPos];
  //     String dealPChild = dealList.asMap().containsKey(iColorPos + 1) ? dealList[iColorPos + 1] : PuyoType.e.name;

  //     // [PuyoPieceType.W] のときに親と子が同じ色になる場合、子を次色に設定
  //     if (puyoPiecesType == PuyoPieceType.W && dealParent == dealPChild) {
  //       PuyoType puyoTypeKey = PuyoType.values.byName(dealPChild);
  //       // 次色取得
  //       int iNext = (AppSettings.puyoTypeDefault.indexOf(puyoTypeKey) + 1) % pickColorType.value;
  //       // 設定
  //       dealPChild = AppSettings.puyoTypeDefault[iNext].name;
  //     }

  //     // ドロップセット追加
  //     dropSetList.add(PuyoDropSet.pair(
  //       puyoPieceType: puyoPiecesType,
  //       puyoTypeParent: PuyoType.values.byName(dealParent),
  //       puyoTypePChild: PuyoType.values.byName(dealPChild),
  //     ));

  //     // 色取得ポジションカウント
  //     // [PuyoPieceType.O] のときは1つ分のみ
  //     if (puyoPiecesType == PuyoPieceType.O) {
  //       iColorPos += 1;
  //     } else {
  //       iColorPos += 2;
  //     }
  //   }

  //   return dropSetList;
  // }

  /// 配色リスト取得
  /// Color List Generation
  List<PuyoType> getDealtColorList(NumOfColorsType numOfColorsType) {
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

  // /// ぷよドロップセット取得
  // PuyoDropSet? getPuyoDropSet(int index) {
  //   // 設定
  //   if (dropSetList.asMap().containsKey(index)) return dropSetList[index];

  //   return null;
  // }
}
