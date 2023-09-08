import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/game_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../model/puyo_piece.dart';
import '../state/main_field_state.dart';

/// プレイコントローラープロバイダ
/// play controller provider
final playControllerProvider = Provider((ref) => PlayController(ref));

class PlayController {
  PlayController(this.ref);

  final Ref ref;
  Timer? playTimer;

  Future<void> action() async {
    // プロバイダー
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    while (true) {
      for (PuyoType puyoType in PuyoType.values) {
        mainFieldState.set(puyoType);
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
