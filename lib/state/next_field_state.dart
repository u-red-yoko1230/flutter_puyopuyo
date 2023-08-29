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

// /// ネクストフィールド情報
// class NextFieldState extends ChangeNotifier {
//   NextFieldState(this.ref);

//   final Ref ref;

//   /// 配ぷよリスト
//   List<PuyoDropSet> dropSetList = [];

//   /// 配色リスト
//   List<String> dealList = [];

//   /// 配ぷよリスト初期化 : とことんモードのみ
//   Future<void> initFreeDropSet({bool isGenDealSet = true, List<dynamic>? loadDealValue}) async {
//     // ステート設定 : とことん
//     final gameSettingInfoCurrent = ref.read(gameSettingInfoCurrentProvider);

//     // ゲームモードの取得
//     final GameModeType gameModeType = GameModeType.values.byName(gameSettingInfoCurrent.value![GameSettingType.mode]!);

//     // ゲームぷよ種類設定
//     final GamePuyoType gamePuyoType = gameModeType.getGamePuyoType();

//     // 色設定の取得
//     final PickColorType pickColorType = PickColorType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksColors]!);

//     // キャラクターの取得
//     final SeriesCharacterType seriesCharacterType = SeriesCharacterType.values.byName(gameSettingInfoCurrent.value![GameSettingType.seriesCharacter]!);

//     // DealSetの取得（色）
//     if (isGenDealSet) {
//       if (loadDealValue != null) {
//         dealList = loadDealValue.map((e) => e.toString()).toList();
//       } else {
//         dealList = await generateDealSet();
//       }
//     }

//     // ShapeSetの取得（形）
//     List<PuyoPieceType> shapeList;
//     if (gamePuyoType == GamePuyoType.tsu) {
//       // 通モードの場合
//       // DropSetの取得（形固定）
//       shapeList = SeriesCharacterType.tsuArle.dropSet;
//     } else {
//       // フィーバーモードの場合
//       // DropSetの取得
//       shapeList = seriesCharacterType.dropSet;
//     }

//     // 配ぷよリスト生成＆設定
//     dropSetList = GameUtility.generateDropSet(AppSettings.iMoves, shapeList: shapeList, dealList: dealList, pickColorType: pickColorType);

//     // 反映
//     notifyListeners();
//   }

//   /// 配色リスト生成 : とことんモードのみ
//   Future<List<String>> generateDealSet() async {
//     // ステート設定 : とことん
//     final appDb = ref.read(pcsAppDbProvider);
//     final gameSettingInfoCurrent = ref.read(gameSettingInfoCurrentProvider);

//     // dealSetの取得（色）
//     final List<String> dealSet;
//     // dealSetの取得（色数別リスト）
//     final List<List<String>> dealSetColors = [[], [], []];

//     // ゲームモードの取得
//     final GameModeType gameModeType = GameModeType.values.byName(gameSettingInfoCurrent.value![GameSettingType.mode]!);

//     // ゲームぷよ種類設定
//     final GamePuyoType gamePuyoType = gameModeType.getGamePuyoType();

//     // ツモ制限の取得
//     final PickPairType picksPairsType = PickPairType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksPairs]!);

//     // 初手制限の取得
//     final PickOverwrittenType picksOverwrittenType = PickOverwrittenType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksOverwritten]!);

//     // 色設定の取得
//     final PickColorType picksColorsType = PickColorType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksColors]!);

//     // 色ぷよのリストを取得
//     final List<PuyoType> colorSet = AppSettings.puyoTypeDefault.toList();

//     // 色ぷよのリストを取得（色数別リスト）
//     final List<List<PuyoType>> colorSetColors = [[], [], []];

//     if (gamePuyoType == GamePuyoType.tsu) {
//       // 通モードの場合
//       // 使用する色をランダム取得する（クラシック除く）
//       colorSet.shuffle();
//     }
//     colorSetColors[0] = colorSet.take(3).toList();
//     colorSetColors[1] = colorSet.take(4).toList();
//     colorSetColors[2] = colorSet.take(5).toList();

//     switch (picksPairsType) {
//       case PickPairType.eSports:
//         // 65535通りからランダムに取得
//         int no = Random().nextInt(65535) + 1;
//         // データベースより、配ぷよ文字列を取得
//         String str = (await appDb.selDealPuyoSetupInfoData('eSports', no)).value;
//         // 取得した文字列をリスト変換
//         dealSetColors[1] = str.split('');
//         break;
//       case PickPairType.handColorEqual128:
//         // テンポラリカラーリストの取得
//         dealSetColors[0] = generateRandomizeDealList(256, colorSetColors[0]);
//         dealSetColors[1] = generateRandomizeDealList(256, colorSetColors[1]);
//         dealSetColors[2] = generateRandomizeDealList(256, colorSetColors[2]);
//         // テンポラリカラーリストのシャッフル
//         dealSetColors[0].shuffle();
//         dealSetColors[1].shuffle();
//         dealSetColors[2].shuffle();
//         break;
//       case PickPairType.handColorEqual16:
//         // ８回分のリスト色取得と追加を繰り返す（256 / 32 = 8
//         for (int i = 0; i < 8; i++) {
//           // 取得
//           List<String> tList3Colors = generateRandomizeDealList(32, colorSetColors[0]);
//           List<String> tList4Colors = generateRandomizeDealList(32, colorSetColors[1]);
//           List<String> tList5Colors = generateRandomizeDealList(32, colorSetColors[2]);
//           // シャッフル
//           tList3Colors.shuffle();
//           tList4Colors.shuffle();
//           tList5Colors.shuffle();
//           // テンポラリカラーリスト追加
//           dealSetColors[0].addAll(tList3Colors);
//           dealSetColors[1].addAll(tList4Colors);
//           dealSetColors[2].addAll(tList5Colors);

//           // カラーセットの再シャッフル
//           colorSetColors[0].shuffle();
//           colorSetColors[1].shuffle();
//           colorSetColors[2].shuffle();
//         }
//         break;
//       case PickPairType.handColorEqual8:
//         // １６回分のリスト色取得と追加を繰り返す（256 / 16 = 16
//         for (int i = 0; i < 16; i++) {
//           // 取得
//           List<String> tList3Colors = generateRandomizeDealList(16, colorSetColors[0]);
//           List<String> tList4Colors = generateRandomizeDealList(16, colorSetColors[1]);
//           List<String> tList5Colors = generateRandomizeDealList(16, colorSetColors[2]);
//           // シャッフル
//           tList3Colors.shuffle();
//           tList4Colors.shuffle();
//           tList5Colors.shuffle();
//           dealSetColors[0].addAll(tList3Colors);
//           dealSetColors[1].addAll(tList4Colors);
//           dealSetColors[2].addAll(tList5Colors);

//           // カラーセットの再シャッフル
//           colorSetColors[0].shuffle();
//           colorSetColors[1].shuffle();
//           colorSetColors[2].shuffle();
//         }
//         break;
//       case PickPairType.random:
//         dealSetColors[0] = List.generate(256, (_) => colorSetColors[0][Random().nextInt(3)].name);
//         dealSetColors[1] = List.generate(256, (_) => colorSetColors[1][Random().nextInt(4)].name);
//         dealSetColors[2] = List.generate(256, (_) => colorSetColors[2][Random().nextInt(5)].name);
//         break;
//     }

//     if ([PickPairType.eSports].contains(picksPairsType)) {
//       // ４色固定、初手制限なし
//       dealSet = dealSetColors[1];
//     } else {
//       // 初手制限設定
//       switch (picksOverwrittenType) {
//         case PickOverwrittenType.firstTwoMovesAreOneToThreeColors:
//           // ４色リストの上書き
//           dealSetColors[1][0] = dealSetColors[0][0];
//           dealSetColors[1][1] = dealSetColors[0][1];
//           dealSetColors[1][2] = dealSetColors[0][2];
//           dealSetColors[1][3] = dealSetColors[0][3];
//           // ５色リストの上書き
//           dealSetColors[2][0] = dealSetColors[0][0];
//           dealSetColors[2][1] = dealSetColors[0][1];
//           dealSetColors[2][2] = dealSetColors[0][2];
//           dealSetColors[2][3] = dealSetColors[0][3];
//           dealSetColors[2][4] = dealSetColors[1][4];
//           dealSetColors[2][5] = dealSetColors[1][5];
//           dealSetColors[2][6] = dealSetColors[1][6];
//           dealSetColors[2][7] = dealSetColors[1][7];
//           break;
//         case PickOverwrittenType.firstThreeMovesAreOneToThreeColors:
//           // ４色リストの上書き
//           dealSetColors[1][0] = dealSetColors[0][0];
//           dealSetColors[1][1] = dealSetColors[0][1];
//           dealSetColors[1][2] = dealSetColors[0][2];
//           dealSetColors[1][3] = dealSetColors[0][3];
//           dealSetColors[1][4] = dealSetColors[0][4];
//           dealSetColors[1][5] = dealSetColors[0][5];
//           // ５色リストの上書き
//           dealSetColors[2][0] = dealSetColors[0][0];
//           dealSetColors[2][1] = dealSetColors[0][1];
//           dealSetColors[2][2] = dealSetColors[0][2];
//           dealSetColors[2][3] = dealSetColors[0][3];
//           dealSetColors[2][4] = dealSetColors[0][4];
//           dealSetColors[2][5] = dealSetColors[0][5];
//           dealSetColors[2][6] = dealSetColors[1][6];
//           dealSetColors[2][7] = dealSetColors[1][7];
//           break;
//         case PickOverwrittenType.firstTwoMovesAreTwoOrThreeColors:
//           // ３色リスト
//           // 初手２手がすべて同じ色の場合、２手目の子を別の色に上書きする
//           if (dealSetColors[0][0] == dealSetColors[0][1] && dealSetColors[0][0] == dealSetColors[0][2] && dealSetColors[0][0] == dealSetColors[0][3]) {
//             List<PuyoType> tList = colorSetColors[0].where((s) => s.name != dealSetColors[0][0]).toList();
//             dealSetColors[0][3] = tList[Random().nextInt(tList.length)].name;
//           }
//           // ４色リストの上書き
//           dealSetColors[1][0] = dealSetColors[0][0];
//           dealSetColors[1][1] = dealSetColors[0][1];
//           dealSetColors[1][2] = dealSetColors[0][2];
//           dealSetColors[1][3] = dealSetColors[0][3];
//           // ５色リストの上書き
//           dealSetColors[2][0] = dealSetColors[0][0];
//           dealSetColors[2][1] = dealSetColors[0][1];
//           dealSetColors[2][2] = dealSetColors[0][2];
//           dealSetColors[2][3] = dealSetColors[0][3];
//           dealSetColors[2][4] = dealSetColors[1][4];
//           dealSetColors[2][5] = dealSetColors[1][5];
//           dealSetColors[2][6] = dealSetColors[1][6];
//           dealSetColors[2][7] = dealSetColors[1][7];
//           break;
//         case PickOverwrittenType.firstTwoMovesAreThreeColors:
//           // ３色リストの上書き
//           dealSetColors[0][0] = colorSet[0].name;
//           dealSetColors[0][1] = colorSet[1].name;
//           dealSetColors[0][2] = colorSet[2].name;
//           // ４色リストの上書き
//           dealSetColors[1][0] = dealSetColors[0][0];
//           dealSetColors[1][1] = dealSetColors[0][1];
//           dealSetColors[1][2] = dealSetColors[0][2];
//           dealSetColors[1][3] = dealSetColors[0][3];
//           // ５色リストの上書き
//           dealSetColors[2][0] = dealSetColors[0][0];
//           dealSetColors[2][1] = dealSetColors[0][1];
//           dealSetColors[2][2] = dealSetColors[0][2];
//           dealSetColors[2][3] = dealSetColors[0][3];
//           dealSetColors[2][4] = dealSetColors[1][4];
//           dealSetColors[2][5] = dealSetColors[1][5];
//           dealSetColors[2][6] = dealSetColors[1][6];
//           dealSetColors[2][7] = dealSetColors[1][7];
//           break;
//         case PickOverwrittenType.none:
//           break;
//       }
//       // 色設定
//       switch (picksColorsType) {
//         case PickColorType.three:
//           dealSet = dealSetColors[0];
//           break;
//         case PickColorType.four:
//           dealSet = dealSetColors[1];
//           break;
//         case PickColorType.five:
//           dealSet = dealSetColors[2];
//           break;
//       }
//     }
//     return dealSet;
//   }

//   /// ランダム色リストの生成
//   List<String> generateRandomizeDealList(int num, List<PuyoType> colorSet) {
//     // 返却リスト生成
//     final List<String> list = List.generate(num, (_) => PuyoType.n.name);
//     // リストへ色を均等に設定
//     list.asMap().forEach((k, v) {
//       list[k] = colorSet[k % colorSet.length].name;
//     });

//     return list;
//   }

//   /// 配ぷよリストからぷよ形種類リスト生成 : なぞなぞモードのみ
//   List<String> generateShapeListFromDropSet() {
//     return (dropSetList.fold<String>('', (previousValue, element) => previousValue + element.puyoPieceType.name)).split('');
//   }

//   /// 配ぷよリストから配色リスト生成 : なぞなぞモードのみ
//   List<String> generateDealSetFromDropSet() {
//     return (dropSetList.fold<String>('', (previousValue, element) {
//       if (element.puyoPieceType == PuyoPieceType.O) {
//         return previousValue + element.getPuyoTypeParent().name;
//       } else {
//         return previousValue + element.getPuyoTypeParent().name + element.getPuyoTypePChild().name;
//       }
//     })).split('');
//   }

//   /// 配ぷよリスト初期化 : なぞなぞモードのみ
//   Future<void> initNazoDropSet({List<dynamic>? loadShapeValue, List<dynamic>? loadDealValue}) async {
//     // 初期化時
//     if (loadShapeValue == null || loadDealValue == null) {
//       // DropSetの初期化
//       dropSetList = [
//         PuyoDropSet.pair(
//           puyoPieceType: PuyoPieceType.I,
//           puyoTypeParent: PuyoType.e,
//           puyoTypePChild: PuyoType.e,
//         )
//       ];
//       dealList = generateDealSetFromDropSet();
//     } else {
//       // マップ情報の変換
//       List<PuyoPieceType> shapeList = loadShapeValue.map((e) => PuyoPieceType.values.byName(e)).toList();
//       List<String> dealList = loadDealValue.map((e) => e.toString()).toList();

//       // 配ぷよリスト生成＆設定
//       dropSetList = GameUtility.generateDropSet(shapeList.length, shapeList: shapeList, dealList: dealList);
//       dealList = generateDealSetFromDropSet();
//     }

//     // 反映
//     notifyListeners();
//   }

//   /// フィールド反映処理 : なぞなぞモードのみ
//   Future<void> reflectDropSet(List<PuyoDropSet> dropSetValue) async {
//     // ロード情報設定
//     dropSetList = [...dropSetValue];
//     dealList = generateDealSetFromDropSet();

//     // 反映
//     notifyListeners();
//   }

//   /// ぷよドロップセット取得
//   PuyoDropSet? getPuyoDropSet(int index) {
//     // 設定
//     if (dropSetList.asMap().containsKey(index)) return dropSetList[index];

//     return null;
//   }

//   /// ぷよタイプ変更 : なぞなぞモードのみ
//   Future<void> updPuyoType(int index, {PuyoType? puyoTypeParent, PuyoType? puyoTypePChild}) async {
//     // 設定
//     if (puyoTypeParent != null) {
//       if (AppSettings.puyoTypeDefault.contains(puyoTypeParent)) dropSetList[index].setPuyoTypeParent(puyoTypeParent);
//     }
//     if (puyoTypePChild != null) {
//       if (AppSettings.puyoTypeDefault.contains(puyoTypePChild)) dropSetList[index].setPuyoTypePChild(puyoTypePChild);
//     }

//     // 反映
//     notifyListeners();
//   }

//   /// ぷよ形タイプ変更 : なぞなぞモードのみ
//   Future<void> updPuyoPieceType(int index, PuyoPieceType puyoPieceType) async {
//     // ステート設定 : なぞなぞ
//     final gameNazoSettingInfoCurrent = ref.read(gameNazoSettingInfoCurrentProvider);

//     // ゲームぷよ種類設定
//     final GamePuyoType gamePuyoType = GamePuyoType.values.byName(gameNazoSettingInfoCurrent.value![GameNazoSettingType.mode]!);

//     // フィーバーモード時のみ
//     if (gamePuyoType == GamePuyoType.fever) {
//       dropSetList[index].puyoPieceType = puyoPieceType;
//       dropSetList[index].puyoTypeAxis = PuyoType.e;
//       dropSetList[index].puyoTypeChild = PuyoType.e;
//       dropSetList[index].puyoTypeChild2 = PuyoType.e;
//       dropSetList[index].puyoTypeChild3 = PuyoType.e;
//     }

//     // 反映
//     notifyListeners();
//   }

//   /// 配ぷよリスト追加 : なぞなぞモードのみ
//   Future<void> addDropSet() async {
//     // リスト追加
//     dropSetList.add(PuyoDropSet(
//       puyoPieceType: PuyoPieceType.I,
//       puyoTypeAxis: PuyoType.e,
//       puyoTypeChild: PuyoType.e,
//       puyoTypeChild2: PuyoType.e,
//       puyoTypeChild3: PuyoType.e,
//     ));

//     // 反映
//     notifyListeners();
//   }

//   /// 配ぷよリスト削除 : なぞなぞモードのみ
//   Future<void> removeDropSet(int index) async {
//     // リスト削除
//     dropSetList.removeAt(index);

//     // 反映
//     notifyListeners();
//   }

//   /// 配ぷよリストぷよ種類未設定チェック : なぞなぞモードのみ
//   bool checkDropSetPuyoType() {
//     return dropSetList.where((value) {
//       if (value.puyoTypeAxis == PuyoType.e) {
//         return true;
//       } else if (value.puyoTypeChild == PuyoType.e) {
//         return true;
//       } else if ([PuyoPieceType.L, PuyoPieceType.J, PuyoPieceType.W, PuyoPieceType.O].contains(value.puyoPieceType)) {
//         if (value.puyoTypeChild2 == PuyoType.e) return true;
//       } else if ([PuyoPieceType.W, PuyoPieceType.O].contains(value.puyoPieceType)) {
//         if (value.puyoTypeChild3 == PuyoType.e) return true;
//       }
//       return false;
//     }).isEmpty;
//   }
// }
