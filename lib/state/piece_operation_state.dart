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

  /// 現在の手数
  int currentMovePosition = 0;

  /// リセット
  void reset() {
    state = const PieceOperation();
    currentMovePosition = 0;

    notifyListeners();
  }

  /// 次
  void moveToNext() {
    currentMovePosition++;
    notifyListeners();
  }

  /// 前
  void backToPrev() {
    currentMovePosition = max(currentMovePosition--, 0);
    notifyListeners();
  }
}
