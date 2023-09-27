import 'dart:async';

import 'package:flutter_puyopuyo/state/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/game_state_type.dart';
import '../enum/player_action_type.dart';
import '../enum/puyo_type.dart';
import '../state/main_field_state.dart';
import '../state/piece_operation_state.dart';

/// ゲームコントローラープロバイダ
/// game controller provider
final gameControllerProvider = Provider((ref) => GameController(ref));

class GameController {
  GameController(this.ref);

  final Ref ref;

  /// プレイヤーアクションリスト
  List<PlayerActionType> playerActionList = [];

  /// 自由落下タイマー
  Timer? freeFallTimer;

  /// ゲームロジック
  Future<void> gameLogic() async {
    // プロバイダー
    // ゲーム状態
    final GameState gameState = ref.read(gameStateProvider.notifier);
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);
    // // メインフィールド
    // final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    // ゲーム状態 : 実行
    gameState.changeOfGameState(GameStateType.run);

    // タイマーセット
    freeFallTimer?.cancel();
    freeFallTimer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      pieceOperationState.pieceFall();
    });

    // アクション
    while (gameState.getState() != GameStateType.none) {
      //#region ゲーム状態 : 実行時
      if (gameState.getState() == GameStateType.run) {}
      //#endregion
      // for (PuyoType puyoType in PuyoType.values) {
      //   mainFieldState.set(puyoType);
      //   await Future.delayed(const Duration(milliseconds: 2000));
      // }
        await Future.delayed(const Duration(microseconds: 1));
    }
    freeFallTimer = null;
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
