import 'dart:async';

import 'package:flutter_puyopuyo/state/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/game_state_type.dart';
import '../enum/player_action_type.dart';
import '../enum/puyo_type.dart';
import '../state/main_field_state.dart';

/// ゲームコントローラープロバイダ
/// game controller provider
final gameControllerProvider = Provider((ref) => GameController(ref));

class GameController {
  GameController(this.ref);

  final Ref ref;

  /// プレイヤーアクションリスト
  List<PlayerActionType> playerActionList = [];

  Timer? playTimer;

  /// ゲームロジック
  Future<void> gameLogic() async {
    // プロバイダー
    // ゲーム状態
    final GameStateType  gameState = ref.read(gameStateProvider);
    final GameState  gameStateNotifier = ref.read(gameStateProvider.notifier);
    // メインフィールド
    final MainFieldState mainFieldNotifier = ref.read(mainFieldStateProvider.notifier);

    // ゲーム状態 : 実行
    gameStateNotifier.changeOfGameState(GameStateType.run);

    // アクション
    while (gameState != GameStateType.none) {
      //#region ゲーム状態 : 実行時
      if (gameState == GameStateType.run) {}
      //#endregion
      for (PuyoType puyoType in PuyoType.values) {
        mainFieldNotifier.set(puyoType);
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    }
  }

  // void game(bool enable) {
  //   // タイマーキャンセル
  //   playTimer?.cancel();

  //   if (enable) {
  //     playTimer = Timer.periodic(_SPEED[_level - 1], (t) {
  //       loop();
  //     });
  //   } else {
  //     playTimer = null;
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
