import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/field_coordinate.dart';
import '../model/puyo.dart';
import '../utility/game_utility.dart';

/// メインフィールド状態プロバイダ
final mainFieldStateProvider = ChangeNotifierProvider((ref) => MainFieldState(ref));

/// メインフィールド状態
class MainFieldState extends ChangeNotifier {
  MainFieldState(this.ref);

  final Ref ref;

  /// メインフィールドリスト
  List<List<PuyoField>> mainFieldList = [];

  /// リセット
  void reset() {
    /// メインフィールドリスト設定
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoField()));

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

  /// 配置
  void placement(
    List<PuyoType> puyoTypeList,
    List<FieldCoordinate> fieldCoordinateList, {
    bool justDropped = false,
  }) {
    assert(puyoTypeList.length == fieldCoordinateList.length);

    // 接地リスト設定
    for (int i in puyoTypeList.asMap().keys) {
      // ぷよ種類
      PuyoType puyoType = puyoTypeList[i];
      // フィールド座標
      FieldCoordinate fieldCoordinate = fieldCoordinateList[i];

      // 設定
      mainFieldList[fieldCoordinate.x][fieldCoordinate.y] = PuyoField(puyoType: puyoType, justDropped: justDropped);
    }

    // 反映
    notifyListeners();
  }

  /// 接地 - ピース(ツモ)
  void groundingPiece() {
    // メインフィールドを列ごとに精査
    for (List<Puyo> mainFieldYList in mainFieldList) {
      // 落下元ぷよの位置
      int iFrom = 0;
      // 落下先ぷよの位置
      int iTo = -1;

      while (iFrom >= 0) {
        // 配置されたぷよのチェック
        iFrom = mainFieldYList.indexWhere((p) => p.getJustDropped(), iFrom);

        // 存在する場合
        if (iFrom >= 0) {
          // 対象ぷよ
          Puyo puyo = mainFieldYList[iFrom].copyWith();

          // 対象以下からぷよもしくは地面(-1)の位置特定
          iTo = iFrom == 0 ? -1 : mainFieldYList.lastIndexWhere((p) => ![PuyoType.n].contains(p.puyoType), iFrom - 1);
          // 落下可能位置を設定(+1)
          iTo += 1;

          // 落下元ぷよの設定
          mainFieldYList[iFrom] = const Puyo.field(puyoType: PuyoType.n);
          // 落下先ぷよの設定
          mainFieldYList[iTo] = Puyo.field(puyoType: puyo.puyoType);

          // 精査先+1
          iFrom += 1;
        }
      }
    }

    // 反映
    notifyListeners();
  }

  /// 接地 - フィールド
  void groundingField() {
    // メインフィールドを列ごとに精査
    for (List<Puyo> mainFieldYList in mainFieldList) {
      // 落下元ぷよの位置
      int iFrom = 0;
      // 落下先ぷよの位置
      int iTo = -1;
      while (iFrom >= 0) {
        // 配置されたぷよのチェック
        iFrom = mainFieldYList.indexWhere((p) => ![PuyoType.w, PuyoType.n].contains(p.puyoType), iFrom);

        // 存在する場合
        if (iFrom >= 0) {
          // 対象ぷよ
          Puyo puyo = mainFieldYList[iFrom].copyWith();

          // 対象以下から壁もしくは地面(-1)の位置特定
          iTo = iFrom == 0 ? -1 : mainFieldYList.lastIndexWhere((p) => ![PuyoType.n].contains(p.puyoType), iFrom - 1);
          // 落下可能位置を設定(+1)
          iTo += 1;

          // 落下元ぷよの設定
          mainFieldYList[iFrom] = const Puyo.field(puyoType: PuyoType.n);
          // 落下先ぷよの設定
          mainFieldYList[iTo] = Puyo.field(puyoType: puyo.puyoType);

          // 精査先+1
          iFrom += 1;
        }
      }
    }

    // 反映
    notifyListeners();
  }

  /// 消去
  bool erase() {
    // 消去フラグ
    bool eraseFlg = false;

    // ぷよ連結情報リスト
    List<PuyoConnection> puyoConnectionList = [];

    // ぷよ連結処理
    GameUtility.connection(mainFieldList, puyoConnectionList: puyoConnectionList);

    // ぷよ消去処理
    for (PuyoConnection puyoConnection in puyoConnectionList) {
      // 連結数が消去可能数を超える場合
      if (puyoConnection.baseAndAdjacentPuyoList.length >= GameSettings.numOfErasablePuyos) {
        // 消去フラグ有効
        eraseFlg = true;

        // ぷよ消去
        for (FieldCoordinate f in puyoConnection.baseAndAdjacentPuyoList) {
          // メインフィールドから消去
          mainFieldList[f.x][f.y] = const PuyoField(puyoType: PuyoType.n);
        }
        // おじゃまぷよ消去
        for (FieldCoordinate f in puyoConnection.baseAndAdjacentOjamaList) {
          // メインフィールドから消去
          if (mainFieldList[f.x][f.y].puyoType == PuyoType.o) {
            mainFieldList[f.x][f.y] = const PuyoField(puyoType: PuyoType.n);
            // } else if (mainFieldList[f.x][f.y].puyoType == PuyoType.k) {
            //   mainFieldList[f.x][f.y] = const PuyoField(puyoType: PuyoType.o);
          }
        }
      }
    }

    // 反映
    notifyListeners();

    return eraseFlg;
  }

  /// 連鎖
  void chain() {
    while (erase()) {
      groundingField();
    }
  }

  // /// 操作ぷよ落下処理
  // Future<bool> dropOperation({required MawashiType mawashiType}) async {
  //   // ステート設定 : 共通
  //   final mainFieldAnimation = ref.read(mainFieldAnimationProvider);
  //   late final GameScoreState? gameScore;

  //   // スコア設定
  //   if (isScore) {
  //     gameScore = ref.read(gameScoreProvider);
  //   } else {
  //     gameScore = null;
  //   }

  //   // 落下処理変数
  //   int yFr, yTo, yCnt;
  //   // ぷよ種類別落下数
  //   Map<PuyoType, int> dropPuyoType = {};
  //   // ちぎりが行われたか
  //   bool isSplits = false;
  //   // 積み直し対象リスト
  //   List<List<PuyoType>> reload = List.generate(AppSettings.iMainFieldX, (_) => List.generate(AppSettings.iMainFieldY, (_) => PuyoType.n));

  //   // 列数分チェック
  //   value.asMap().forEach((x, px) {
  //     // チェック範囲設定
  //     // フィールド内、直前に設置完了した一番上の操作ぷよの存在チェック
  //     yTo = px.lastIndexWhere((i) => i.dropNow);

  //     // 操作ぷよが存在する列の場合
  //     if (yTo != -1) {
  //       // 上から操作ぷよ以外のぷよ(壁)の位置特定
  //       yFr = px.lastIndexWhere((i) => !i.dropNow && i.puyoType != PuyoType.n, yTo);
  //       // 特定位置から一つ上を対象
  //       yFr += 1;
  //       // 落下処理判定変数の設定
  //       yCnt = yFr - 1;

  //       // 精査対象をチェック
  //       for (int y = yFr; y <= yTo; y++) {
  //         // 直前に設置完了した操作ぷよの場合
  //         if (px[y].dropNow) {
  //           // カウント
  //           yCnt++;
  //           // ぷよ種類別落下数カウント
  //           dropPuyoType[px[y].puyoType] = (dropPuyoType[px[y].puyoType] ?? 0) + 1;
  //           // ちぎり実行フラグ
  //           if (y != yCnt) isSplits = true;
  //           // アニメーションリストの設定
  //           mainFieldAnimation.parameter[x][yCnt] = PuyoFieldAnimeParameter(
  //             isRun: true,
  //             puyoMainBef: px[y],
  //             listPosYBef: y,
  //             listPosYAft: yCnt,
  //           );
  //           // フィーバーかつ１４段目の場合、積み直しせずクリアされる
  //           if (!(mawashiType == MawashiType.fever && yCnt >= (AppSettings.iMainFieldY - 1))) {
  //             // 下から積み直す
  //             reload[x][yCnt] = px[y].puyoType;
  //           }
  //           // クリア
  //           value[x][y] = PuyoField(puyoType: PuyoType.n);
  //         }
  //       }
  //     }
  //   });

  //   // メインフィールドへの反映
  //   notifyListeners();

  //   // 落下アニメーション
  //   await mainFieldAnimation.drop();

  //   // スコアステート情報反映
  //   if (gameScore != null) {
  //     gameScore.set(
  //       totalSplit: gameScore.value.totalSplit + (isSplits ? 1 : 0),
  //       addDrop: dropPuyoType,
  //     );
  //   }

  //   // メインフィールドへ積み直し適用
  //   reload.asMap().forEach((x, px) {
  //     px.asMap().forEach((y, py) {
  //       if (py != PuyoType.n) {
  //         value[x][y] = PuyoField(puyoType: py);
  //       }
  //     });
  //   });

  //   // アニメーション初期化
  //   await mainFieldAnimation.init();

  //   // メインフィールドへの反映
  //   notifyListeners();

  //   return true;
  // }

  // /// フィールドぷよ落下処理
  // Future<bool> dropField({required MawashiType mawashiType}) async {
  //   // ステート設定 : 共通
  //   final mainFieldAnimation = ref.read(mainFieldAnimationProvider);

  //   // 落下処理変数
  //   int yFr, yTo, yNone, yPuyo, yPuyoCur, yCnt;
  //   // 落下処理が行われたか
  //   bool isDrop = false;
  //   // 積み直し対象リスト
  //   List<List<PuyoType>> reload = List.generate(AppSettings.iMainFieldX, (_) => List.generate(AppSettings.iMainFieldY, (_) => PuyoType.n));

  //   // 落下対象最大段数設定
  //   int yMax = AppSettings.iMainFieldY - 1;
  //   // まわし種類が[SUN]の場合、１４段目まで有効
  //   if (mawashiType == MawashiType.sun) {
  //     yMax = AppSettings.iMainFieldY;
  //   }

  //   // 列数分チェック
  //   value.asMap().forEach((x, px) {
  //     // 精査対象From初期設定
  //     yFr = 0;
  //     // 最上段までチェック
  //     while (yFr < yMax) {
  //       // チェック範囲設定
  //       // フィールド内、縦列の壁ぷよの存在チェック
  //       yTo = px.indexWhere((i) => i.puyoType == PuyoType.w, yFr);
  //       // 壁ぷよが存在しなければ、フィールド最上部の壁を設定
  //       if (yTo == -1) yTo = yMax;
  //       // 壁よりひとつ下を精査対象Toとして設定
  //       yTo--;

  //       // 下から空白の位置特定
  //       yNone = px.indexWhere((i) => i.puyoType == PuyoType.n, yFr);
  //       // 上からぷよの位置特定
  //       yPuyo = px.lastIndexWhere((i) => i.puyoType != PuyoType.n, yTo);
  //       // 直前に設置完了した操作ぷよが存在する
  //       yPuyoCur = px.lastIndexWhere((i) => i.dropNow, yTo);

  //       // 落下処理判定変数の設定
  //       yCnt = yFr - 1;
  //       // 空白上部にぷよが存在する場合 or 直前に設置完了した操作ぷよが存在する
  //       if ((yNone != -1 && yPuyo != -1 && yNone < yPuyo) || yPuyoCur != -1) {
  //         // 落下処理実行フラグ
  //         isDrop = true;
  //         // 精査対象をチェック
  //         for (int y = yFr; y <= yTo; y++) {
  //           // ぷよの場合
  //           if (px[y].puyoType != PuyoType.n) {
  //             // カウント
  //             yCnt++;
  //             // 落下するぷよ or 直前に設置完了した操作ぷよの場合
  //             if (yCnt < y || px[y].dropNow) {
  //               // 落下するぷよの左右の結合を解除する
  //               if (x > 0) {
  //                 value[x - 1][y].connectRight = false;
  //               }
  //               if (x < (AppSettings.iMainFieldX - 1)) {
  //                 value[x + 1][y].connectLeft = false;
  //               }
  //               // アニメーションリストの設定
  //               mainFieldAnimation.parameter[x][yCnt] = PuyoFieldAnimeParameter(
  //                 isRun: true,
  //                 puyoMainBef: px[y],
  //                 listPosYBef: y,
  //                 listPosYAft: yCnt,
  //               );
  //               // 下から積み直す
  //               reload[x][yCnt] = px[y].puyoType;
  //               // クリア
  //               value[x][y] = PuyoField(puyoType: PuyoType.n);
  //             }
  //           }
  //         }
  //       }
  //       // 壁を超えた先を精査対象に設定
  //       yFr = yTo + 2;
  //     }
  //   });

  //   // 落下処理が行われている場合
  //   if (isDrop) {
  //     // メインフィールドへの反映
  //     notifyListeners();

  //     // 落下アニメーション
  //     await mainFieldAnimation.drop();

  //     // メインフィールドへ積み直し適用
  //     reload.asMap().forEach((x, px) {
  //       px.asMap().forEach((y, py) {
  //         if (py != PuyoType.n) {
  //           value[x][y] = PuyoField(puyoType: py);
  //         }
  //       });
  //     });

  //     // アニメーション初期化
  //     await mainFieldAnimation.init();
  //   }

  //   // メインフィールドへの反映
  //   notifyListeners();

  //   return isDrop;
  // }

  // /// おじゃまぷよ落下処理
  // /// TODO: 14段目に存在する場合、降らないバグあり
  // Future<bool> dropOjama(List<List<PuyoType>> dropList) async {
  //   // ステート設定 : 共通
  //   final mainFieldAnimation = ref.read(mainFieldAnimationProvider);

  //   // 落下処理変数
  //   int yFr, yTo, yCnt;
  //   int yCntSpe;
  //   // 積み直し対象リスト
  //   List<List<PuyoType>> reload = List.generate(AppSettings.iMainFieldX, (_) => List.generate(AppSettings.iMainFieldY, (_) => PuyoType.n));

  //   // 列数分チェック
  //   value.asMap().forEach((x, px) {
  //     // チェック範囲設定
  //     // 上からぷよ(壁)の位置特定
  //     yFr = px.lastIndexWhere((i) => i.puyoType != PuyoType.n);
  //     // 特定位置から一つ上を対象
  //     yFr += 1;
  //     // フィールド最上部を設定
  //     yTo = px.length - 1;

  //     // 落下処理判定変数の設定
  //     yCnt = yFr - 1;
  //     yCntSpe = -1;

  //     // 精査対象をチェック
  //     for (int y = yFr; y <= yTo; y++) {
  //       // カウント
  //       yCntSpe++;

  //       // 指定ぷよが存在する場合
  //       if (dropList[x][yCntSpe] != PuyoType.n) {
  //         // カウント
  //         yCnt++;
  //         // アニメーションリストの設定
  //         mainFieldAnimation.parameter[x][yCnt] = PuyoFieldAnimeParameter(
  //           isRun: true,
  //           puyoMainBef: PuyoField(puyoType: dropList[x][yCntSpe]),
  //           listPosYBef: (yTo + 1 + yCntSpe),
  //           listPosYAft: yCnt,
  //         );
  //         // 下から積み直す
  //         reload[x][yCnt] = dropList[x][yCntSpe];
  //       }
  //     }
  //   });

  //   // メインフィールドへの反映
  //   notifyListeners();

  //   // 落下アニメーション
  //   await mainFieldAnimation.drop();

  //   // メインフィールドへ積み直し適用
  //   reload.asMap().forEach((x, px) {
  //     px.asMap().forEach((y, py) {
  //       if (py != PuyoType.n) {
  //         value[x][y] = PuyoField(puyoType: py);
  //       }
  //     });
  //   });

  //   // アニメーション初期化
  //   await mainFieldAnimation.init();

  //   // メインフィールドへの反映
  //   notifyListeners();

  //   return true;
  // }

  // /// ぷよ消去処理
  // Future<bool> erase() async {
  //   // ステート設定 : 共通
  //   final operation = ref.read(operationProvider);
  //   final mainFieldAnimation = ref.read(mainFieldAnimationProvider);
  //   final chainsAnimation = ref.read(chainsAnimationProvider);
  //   late final GameScoreState? gameScore;
  //   // ステート設定 : とことん
  //   final gameSettingInfoCurrent = ref.read(gameSettingInfoCurrentProvider);
  //   // ステート設定 : なぞなぞ
  //   final gameNazoSettingInfoCurrent = ref.read(gameNazoSettingInfoCurrentProvider);

  //   // スコア計算チェック
  //   if (isScore) {
  //     gameScore = ref.read(gameScoreProvider);
  //   } else {
  //     gameScore = null;
  //   }

  //   // ゲームぷよ種類の取得
  //   late final GamePuyoType gamePuyoType;
  //   // キャラクターの取得
  //   late final SeriesCharacterType seriesCharacterType;

  //   if (operation.pcsMode == PCSModeType.free) {
  //     // とことんモード
  //     // ゲームモードの取得
  //     GameModeType gameModeType = GameModeType.values.byName(gameSettingInfoCurrent.value![GameSettingType.mode]!);
  //     // ゲームぷよ種類の取得
  //     gamePuyoType = gameModeType.getGamePuyoType();
  //     // キャラクターの設定
  //     seriesCharacterType = SeriesCharacterType.values.byName(gameSettingInfoCurrent.value![GameSettingType.seriesCharacter]!);
  //   } else {
  //     // なぞなぞモード
  //     // ゲームぷよ種類の取得
  //     gamePuyoType = GamePuyoType.values.byName(gameNazoSettingInfoCurrent.value![GameNazoSettingType.mode]!);
  //     // キャラクターの設定
  //     seriesCharacterType = SeriesCharacterType.tsuArle;
  //   }

  //   // 連結ぷよ座標保持リスト 0:x 1:y
  //   List<List<List<int>>> conPos = [];
  //   // 連結おじゃまぷよ座標保持リスト 0:x 1:y
  //   List<List<List<int>>> conPosOjama = [];

  //   // 得点計算用変数
  //   // 連結数リスト
  //   List<int> pntConnect = [];
  //   // 色リスト
  //   List<PuyoType> pntColor = [];
  //   // 結果 : 消去数
  //   int pntResultErase = 0;
  //   // 結果 : 連鎖ボーナス
  //   int pntResultRensaBonus = 0;
  //   // 結果 : 連結ボーナス
  //   int pntResultConnectBonus = 0;
  //   // 結果 : 色数ボーナス
  //   int pntResultColorBonus = 0;

  //   // ぷよ種類別消去数
  //   Map<PuyoType, int> erasePuyoType = {};

  //   // 消去処理が行われたか
  //   bool isErase = false;
  //   // 連鎖数表示用 : X
  //   int isErasePosX = 0;
  //   // 連鎖数表示用 : Y
  //   int isErasePosY = 0;

  //   // 連結チェック処理
  //   GameUtility.connect(value, conPos: conPos, conPosOjama: conPosOjama);

  //   // 消去、得点設定
  //   conPos.asMap().forEach((key, val) {
  //     // 連結数が消去可能数を超える場合
  //     if (val.length >= AppSettings.iErases) {
  //       // 消去処理実行フラグ
  //       if (!isErase) {
  //         isErase = true;
  //         isErasePosX = val[0][0];
  //         isErasePosY = val[0][1];
  //       }

  //       // 連結数追加
  //       pntConnect.add(val.length);

  //       // 色情報取得
  //       PuyoType tColor = value[val[0][0]][val[0][1]].puyoType;
  //       // 色追加
  //       if (!pntColor.contains(tColor)) pntColor.add(tColor);

  //       // ぷよ種類別消去数カウント
  //       erasePuyoType[tColor] = (erasePuyoType[tColor] ?? 0) + val.length;

  //       // 色系ぷよ消去
  //       val.asMap().forEach((k, v) {
  //         // アニメーションリストの設定
  //         mainFieldAnimation.parameter[v[0]][v[1]] = PuyoFieldAnimeParameter(
  //           isRun: true,
  //           puyoMainBef: value[v[0]][v[1]],
  //           puyoMainAft: PuyoField(puyoType: PuyoType.n),
  //         );
  //         // メインフィールドからの消去
  //         value[v[0]][v[1]] = PuyoField(puyoType: PuyoType.n);
  //       });

  //       // おじゃま系ぷよ消去
  //       conPosOjama[key].asMap().forEach((k, v) {
  //         if (value[v[0]][v[1]].puyoType == PuyoType.o) {
  //           // アニメーションリストの設定
  //           mainFieldAnimation.parameter[v[0]][v[1]] = PuyoFieldAnimeParameter(
  //             isRun: true,
  //             puyoMainBef: value[v[0]][v[1]],
  //             puyoMainAft: PuyoField(puyoType: PuyoType.n),
  //           );
  //           // メインフィールドからの消去
  //           value[v[0]][v[1]] = PuyoField(puyoType: PuyoType.n);
  //         } else if (value[v[0]][v[1]].puyoType == PuyoType.k) {
  //           // アニメーションリストの設定
  //           mainFieldAnimation.parameter[v[0]][v[1]] = PuyoFieldAnimeParameter(
  //             isRun: true,
  //             puyoMainBef: value[v[0]][v[1]],
  //             puyoMainAft: PuyoField(puyoType: PuyoType.o),
  //           );
  //           // メインフィールドからの消去
  //           value[v[0]][v[1]] = PuyoField(puyoType: PuyoType.o);
  //         }
  //       });
  //     }
  //   });

  //   // 消去されている場合
  //   if (isErase) {
  //     // メインフィールドへの反映
  //     notifyListeners();

  //     // 連鎖数カウント
  //     int resultRensa = rensaCount + 1;

  //     // 得点計算
  //     // 消去数、連結ボーナス
  //     pntConnect.asMap().forEach((k, v) {
  //       pntResultErase += v;
  //       pntResultConnectBonus += GameUtility.getConnectBonus(v, gamePuyoType);
  //     });
  //     // 連鎖ボーナス
  //     pntResultRensaBonus = GameUtility.getRensaBonus(resultRensa, gamePuyoType, seriesCharacterType);
  //     // 色数ボーナス
  //     pntResultColorBonus = GameUtility.getColorBonus(pntColor.length, gamePuyoType);
  //     // スコアカウント
  //     int tScore = (pntResultRensaBonus + pntResultConnectBonus + pntResultColorBonus);
  //     if (tScore <= 0) tScore = 1;
  //     if (tScore > 999) tScore = 999;
  //     // スコア計算結果
  //     int resultScore = pntResultErase * 10 * tScore;

  //     // フィールドステート情報反映
  //     set(chains: resultRensa, score: scoreCount + resultScore);

  //     // スコアステート情報反映
  //     if (gameScore != null) {
  //       gameScore.set(
  //         chain: resultRensa,
  //         numOfSimErase: pntResultErase,
  //         typeOfSimErase: pntColor.length,
  //         totalScore: gameScore.value.totalScore + resultScore,
  //         addErase: erasePuyoType,
  //       );
  //     }

  //     // 連鎖数表示アニメーション
  //     chainsAnimation.display(
  //       resultRensa,
  //       isErasePosX * AppSettings.baseDps,
  //       ((AppSettings.iMainFieldY - 1) - isErasePosY) * AppSettings.baseDps,
  //     );

  //     // 消去アニメーション
  //     await mainFieldAnimation.erase();

  //     // アニメーション初期化
  //     await mainFieldAnimation.init();
  //   }

  //   return isErase;
  // }

  // /// ぷよ検索処理
  // int find(List<PuyoType> puyoType) {
  //   return value.expand((x) => x).where((type) => puyoType.contains(type.puyoType)).length;
  // }

  /// セット
  void set(PuyoType puyoType) {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoField(puyoType: puyoType)));
    notifyListeners();
  }

  /// テスト
  Future<void> test() async {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoField(puyoType: PuyoType.r)));
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 5000));
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoField(puyoType: PuyoType.g)));
    notifyListeners();
  }

  /// テスト
  Future<void> test2() async {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoField(puyoType: PuyoType.n)));
    mainFieldList[0][3] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[0][5] = const PuyoField(puyoType: PuyoType.g);
    mainFieldList[0][6] = const PuyoField(puyoType: PuyoType.b);
    mainFieldList[0][8] = const PuyoField(puyoType: PuyoType.y);
    mainFieldList[1][3] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[1][4] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[2][3] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[5][0] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[5][1] = const PuyoField(puyoType: PuyoType.g);
    mainFieldList[5][2] = const PuyoField(puyoType: PuyoType.g);
    mainFieldList[5][3] = const PuyoField(puyoType: PuyoType.g);
    mainFieldList[5][4] = const PuyoField(puyoType: PuyoType.g);
    mainFieldList[5][5] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[5][6] = const PuyoField(puyoType: PuyoType.r);
    mainFieldList[5][7] = const PuyoField(puyoType: PuyoType.r);
    notifyListeners();
  }
}
