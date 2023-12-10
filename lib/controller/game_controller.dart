import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enum/game_state_type.dart';
import '../enum/player_action_type.dart';
import '../game_settings.dart';
import '../state/piece_operation_state.dart';

/// ゲームコントローラープロバイダ
/// game controller provider
final gameControllerProvider = Provider((ref) => GameController(ref));

class GameController {
  GameController(this.ref);

  final Ref ref;

  /// ゲーム状態
  GameStateType currentGameState = GameStateType.none;

  /// プレイヤーアクションリスト
  List<PlayerActionType> playerActionList = [];

  /// testTime
  int time = 50;
  int time1 = 50;
  int time2 = 40;

  /// 自由落下タイマー
  Timer? freeFallTimer;

  /// ゲーム状態の変更
  void changeOfGameState(GameStateType gameState) {
    // 変更前ゲーム状態による前処理

    // ゲームモード変更
    currentGameState = gameState;

    // 変更後ゲーム状態による後処理
    //#region ゲーム状態 : 実行時
    if (currentGameState == GameStateType.run) {
      changeOfFallMode(true, false);
    }
    //#endregion
    //#region ゲーム状態 : 停止時
    else if (currentGameState == GameStateType.pause) {
      changeOfFallMode(false, false);
    }
    //#endregion
  }

  /// ゲームロジック
  Future<void> gameLogic() async {
    // プロバイダー
    // // ゲーム状態
    // final GameState gameState = ref.read(gameStateProvider.notifier);
    // // ピース(ツモ)操作状態
    // final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);
    // // メインフィールド
    // final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    // // ゲーム状態 : 実行
    // gameState.changeOfGameState(GameStateType.run);

    // // タイマーセット
    // freeFallTimer?.cancel();
    // freeFallTimer = Timer.periodic(Duration(milliseconds: time), (t) {
    //   pieceOperationState.pieceFall();
    // });

    // 現在の状態

    // アクション
    while (currentGameState != GameStateType.none) {
      //#region ゲーム状態 : 実行時
      if (currentGameState == GameStateType.run) {
        // if (playerActionList.contains(PlayerActionType.crossKeyDown)) {
        //   time = time2;
        //   // freeFallTimer?.cancel();
        //   freeFallTimer = null;
        //   freeFallTimer = Timer.periodic(Duration(milliseconds: time), (t) {
        //     pieceOperationState.pieceFall();
        //   });
        // } else {
        //   time = time1;
        // }
      }
      //#endregion
      // for (PuyoType puyoType in PuyoType.values) {
      //   mainFieldState.set(puyoType);
      //   await Future.delayed(const Duration(milliseconds: 2000));
      // }
      await Future.delayed(const Duration(microseconds: 1));
    }
    // freeFallTimer = null;
  }

  /// 落下モードの変更
  void changeOfFallMode(bool enable, bool fast) {
    // プロバイダー
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    freeFallTimer?.cancel();
    freeFallTimer = null;
    if (enable) {
      freeFallTimer = Timer.periodic(Duration(microseconds: fast ? GameSettings.fastFallSpeed : GameSettings.freeFallSpeed), (t) {
        pieceOperationState.pieceFall();
      });
    }
  }
  // /// ゲーム開始/終了
  // void game(bool enable) {
  //   // タイマーキャンセル
  //   freeFallTimer?.cancel();

  //   if (enable) {
  //     freeFallTimer = Timer.periodic(_SPEED[_level - 1], (t) {
  //       loop();
  //     });
  //   } else {
  //     freeFallTimer = null;
  //   }
  // }

  // void loop() {}
}

// class PlayController {
//   PlayController._(this.ref) {
//     throw AssertionError("private Constructor");
//   }
//   // PlayController._() {
//   //   throw AssertionError("private Constructor");
//   // }
//   final Ref ref;
//   static Timer? playTimer;

//   void game(bool enable) {
//     // タイマーキャンセル
//     playTimer?.cancel();

//     if (enable) {
//       playTimer = Timer.periodic(_SPEED[_level - 1], (t) {
//         loop();
//       });
//     } else {
//       playTimer = null;
//     }
//   }

//   void loop() {}
// }
