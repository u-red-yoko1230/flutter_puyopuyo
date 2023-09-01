import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/puyo_field.dart';
import '../model/puyo_piece.dart';

/// メインフィールド状態プロバイダ
/// main field state provider
final mainFieldStateProvider = StateNotifierProvider<MainFieldState, List<List<PuyoPiece>>>((ref) => MainFieldState(ref));

/// メインフィールド状態
/// Main field condition
class MainFieldState extends StateNotifier<List<List<PuyoPiece>>> {
  MainFieldState(this.ref) : super([[], []]);

  final Ref ref;

  /// フィールドリセット
  void reset() {
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece()));
  }

  /// テスト
  Future<void> test() async {
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece.field(puyoType: PuyoType.r)));
    await Future.delayed(const Duration(milliseconds: 5000));
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => const PuyoPiece.field(puyoType: PuyoType.g)));
  }
}
