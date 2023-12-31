import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../enum/game_state_type.dart';
import '../enum/puyo_shape_type.dart';
import '../game_settings.dart';
import '../model/drop_set.dart';
import '../model/piece_operation.dart';
import '../model/puyo.dart';
import '../state/drop_set_state.dart';
import '../state/game_state.dart';
import '../state/piece_operation_state.dart';
import 'puyo_widget.dart';

/// ピース(ツモ)操作フィールド
/// Piece Operation Field
class PieceOperationFieldWidget extends ConsumerWidget {
  const PieceOperationFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダー
    // ゲーム状態
    final GameStateType gameState = ref.watch(gameStateProvider);
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.watch(pieceOperationStateProvider);
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.watch(dropSetStateProvider);

    // 現在手のドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(pieceOperationState.currentHandPosition);

    // ウィジェット
    // 組ぷよフィールド : ぷよ
    final List<Widget> widgetsPuyo = [];

    // ドロップセットが取得できる場合
    if (dropSet != null) {
      // ぷよ形状の取得
      final PuyoShapeType puyoShapeType = dropSet.puyoShapeType;
      // ぷよ種類の取得(軸)
      final Puyo puyoAxis = Puyo(puyoType: dropSet.getPuyoTypeAxis());
      // ぷよ種類の取得(子)
      final Puyo puyoChild = Puyo(puyoType: dropSet.getPuyoTypeChild());

      // 移動距離
      double moveSteps = AppSettings.puyoSize / GameSettings.numOfMoveSteps;

      // ぷよ形状別設定
      switch (puyoShapeType) {
        case PuyoShapeType.I:
          // 軸
          widgetsPuyo.add(
            Positioned(
              left: moveSteps * pieceOperationState.state.axisPositionDisplayX,
              top: moveSteps * pieceOperationState.state.axisPositionDisplayY,
              child: PuyoWidget(
                puyo: puyoAxis,
                size: AppSettings.puyoSize,
              ),
            ),
          );
          // 子
          widgetsPuyo.add(
            Positioned(
              left: moveSteps * pieceOperationState.state.childPositionDisplayX,
              top: moveSteps * pieceOperationState.state.childPositionDisplayY,
              child: PuyoWidget(
                puyo: puyoChild,
                size: AppSettings.puyoSize,
              ),
            ),
          );
          break;
        default:
          break;
      }
    }

    // ピース(ツモ)操作フィールド
    return SizedBox(
      width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
      height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
      child: Visibility(
        visible: gameState == GameStateType.run,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: false,
        child: Stack(children: widgetsPuyo),
      ),
    );
  }
}
