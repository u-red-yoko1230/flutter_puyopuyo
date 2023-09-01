// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../enum/puyo_type.dart';
// import '../game_settings.dart';
// import '../model/puyo_field_animation.dart';

// /// メインフィールドアニメーション状態プロバイダ
// /// main field animation state provider
// final mainFieldAnimationStateProvider = StateNotifierProvider<MainFieldAnimationState, List<List<PuyoFieldAnimation>>>((ref) => MainFieldAnimationState(ref));

// /// メインフィールドアニメーション状態
// /// Main field animation condition
// class MainFieldAnimationState extends StateNotifier<List<List<PuyoFieldAnimation>>> {
//   MainFieldAnimationState(this.ref) : super([[], []]);

//   final Ref ref;

//   /// フィールドリセット
//   void reset() {
//     state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoFieldAnimation()));
//   }

//   /// テスト
//   Future<void> test() async {
//     state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoFieldAnimation(puyoType: PuyoType.r)));
//     await Future.delayed(const Duration(milliseconds: 5000));
//     state = List.generate(GameSettings.mainFieldXSize, (_) => List.generate(GameSettings.mainFieldYSize, (_) => PuyoFieldAnimation(puyoType: PuyoType.g)));
//   }
// }
