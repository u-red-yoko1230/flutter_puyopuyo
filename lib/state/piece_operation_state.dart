import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/piece_operation.dart';
import '../model/puyo_field.dart';
import '../model/puyo_piece.dart';

/// ピース(ツモ)操作状態プロバイダ
/// piece operation state provider
final pieceOperationStateProvider = ChangeNotifierProvider((ref) => PieceOperationState(ref));

/// ピース(ツモ)操作状態
/// piece operation state
class PieceOperationState extends ChangeNotifier {
  PieceOperationState(this.ref);

  final Ref ref;

  /// ピース(ツモ)操作
  /// Piece operation
  PieceOperation state = const PieceOperation();

  /// リセット
  /// reset
  void reset() {
    state = const PieceOperation();

    notifyListeners();
  }
}
