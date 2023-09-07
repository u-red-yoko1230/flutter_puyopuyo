import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayController extends ChangeNotifier {
  PlayController(this.ref);

  final Ref ref;
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
