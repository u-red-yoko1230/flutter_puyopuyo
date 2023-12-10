// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../enum/game_state_type.dart';

// /// ゲーム状態プロバイダ
// final gameStateProvider = StateNotifierProvider<GameState, GameStateType>((ref) => GameState(ref));

// /// ゲーム状態
// class GameState extends StateNotifier<GameStateType> {
//   GameState(this.ref) : super(GameStateType.none);

//   final Ref ref;

//   GameStateType getState() {
//     return state;
//   }

//   /// ゲーム状態の変更
//   void changeOfGameState(GameStateType gameState) => state = gameState;
// }
