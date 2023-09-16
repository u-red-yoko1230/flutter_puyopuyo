import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/puyo_piece.dart';

/// メインフィールド状態プロバイダ
final mainFieldStateProvider = ChangeNotifierProvider((ref) => MainFieldState(ref));

/// メインフィールド状態
class MainFieldState extends ChangeNotifier {
  MainFieldState(this.ref);

  final Ref ref;

  /// メインフィールドリスト
  List<List<PuyoPiece>> mainFieldList = [];

  /// リセット
  void reset() {
    /// メインフィールドリスト設定
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece()));

    // 反映
    notifyListeners();
  }

  /// セット
  void set(PuyoType puyoType) {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoPiece.field(puyoType: puyoType)));
    notifyListeners();
  }

  /// テスト
  Future<void> test() async {
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece.field(puyoType: PuyoType.r)));
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 5000));
    mainFieldList = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece.field(puyoType: PuyoType.g)));
    notifyListeners();
  }
}
