import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/piece_operation.dart';

/// ピース(ツモ)操作状態プロバイダ
final pieceOperationStateProvider = ChangeNotifierProvider((ref) => PieceOperationState(ref));

/// ピース(ツモ)操作状態
class PieceOperationState extends ChangeNotifier {
  PieceOperationState(this.ref);

  final Ref ref;

  /// ピース(ツモ)操作
  PieceOperation state = const PieceOperation();

  /// 現在の手数位置
  int currentHandPosition = 0;

  /// リセット
  void reset() {
    state = const PieceOperation();
    currentHandPosition = 0;

    notifyListeners();
  }

  /// 手数位置移動 : 次
  void moveToNextHandPosition() {
    currentHandPosition++;
    notifyListeners();
  }

  /// 手数位置移動 : 前
  void backToPrevHandPosition() {
    currentHandPosition = max(currentHandPosition--, 0);
    notifyListeners();
  }

  /// ピース(ツモ)落下
  void pieceFall() {
    state = state.copyWith(axisPositionY: state.axisPositionY + 1);
    notifyListeners();
  }
}
