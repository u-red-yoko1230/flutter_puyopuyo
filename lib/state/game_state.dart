import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/game_state_type.dart';

/// ゲーム状態プロバイダ
/// game state provider
final gameStateProvider = StateNotifierProvider<GameState, GameStateType>((ref) => GameState(ref));

/// ゲーム状態
/// Game state
class GameState extends StateNotifier<GameStateType> {
  GameState(this.ref) : super(GameStateType.none);

  final Ref ref;

  /// ゲーム状態の変更
  void changeOfGameState(GameStateType gameState) => state = gameState;
}
