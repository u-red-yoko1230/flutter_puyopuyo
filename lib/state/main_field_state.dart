import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/puyo_type.dart';
import '../game_settings.dart';
import '../model/puyo_field.dart';

/// メインフィールド状態プロバイダ
/// main field state provider
final mainFieldStateProvider = StateNotifierProvider<MainFieldState, List<List<PuyoField>>>((ref) => MainFieldState(ref));

/// メインフィールド状態
/// Main field condition
class MainFieldState extends StateNotifier<List<List<PuyoField>>> {
  MainFieldState(this.ref) : super([[], []]);

  final Ref ref;

  /// フィールドリセット
  void reset() {
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoField()));
  }

  /// テスト
  Future<void> test() async {
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoField(puyoType: PuyoType.r)));
    await Future.delayed(const Duration(milliseconds: 5000));
    state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoField(puyoType: PuyoType.g)));
  }
}
