import 'package:flutter_puyopuyo/enum/puyo_type.dart';
import 'package:flutter_puyopuyo/game_settings.dart';
import 'package:flutter_puyopuyo/model/puyo_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainFieldStateProvider = StateNotifierProvider<MainFieldState, List<List<PuyoField>>>((ref) => MainFieldState(ref));

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
