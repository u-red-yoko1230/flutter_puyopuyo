import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 現在の手数位置プロバイダ
final currentMovePositionStateProvider = StateNotifierProvider<CurrentMovePositionState, int>((ref) => CurrentMovePositionState(ref));

/// 現在の手数位置状態
class CurrentMovePositionState extends StateNotifier<int> {
  CurrentMovePositionState(this.ref) : super(0);

  final Ref ref;

  int getState() {
    return state;
  }

  /// 初期化
  void initialize() => state = 0;

  /// 次
  void next() => state++;

  /// 前
  void prev() => max(state--, 0);
}
