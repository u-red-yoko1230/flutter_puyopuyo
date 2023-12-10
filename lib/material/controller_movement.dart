import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_settings.dart';
import '../controller/game_controller.dart';
import '../enum/move_operation_type.dart';
import '../state/piece_operation_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（移動）
class ControllerMovement extends HookConsumerWidget {
  const ControllerMovement({
    super.key,
    required this.orientation,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サイズ設定
    // コントローラーボタンサイズ
    final double ctrlBtnSize = AppSettings.baseCtrlBtnSize[orientation]!.r;

    // プロバイダー
    // プレイコントローラ
    final GameController playController = ref.read(gameControllerProvider);
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    return Container(
      width: ctrlBtnSize * 3,
      height: ctrlBtnSize * 3,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 左移動
          Positioned(
            left: 0,
            top: ctrlBtnSize,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
              icon: Icons.west,
              iconSize: ctrlBtnSize,
              onTap: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // ピース(ツモ)横移動
                pieceOperationState.pieceHorizontalMove(MoveOperationType.L);
              },
            ),
          ),
          // クイックドロップ
          Positioned(
            left: ctrlBtnSize,
            top: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
              icon: Icons.north,
              iconSize: ctrlBtnSize,
              onTap: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // クイックドロップ
                // operation.mainOperation(OperationRequestType.quickDrop);
              },
            ),
          ),
          // ソフトドロップ
          Positioned(
            left: ctrlBtnSize,
            bottom: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
              icon: Icons.south,
              iconSize: ctrlBtnSize,
              onTapDown: () {
                // 高速落下 : 有効
                playController.fastFall(true);
              },
              onTapUp: () {
                // 高速落下 : 無効
                playController.fastFall(false);
              },
            ),
          ),
          // 右移動
          Positioned(
            right: 0,
            top: ctrlBtnSize,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
              icon: Icons.east,
              iconSize: ctrlBtnSize,
              onTap: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // ピース(ツモ)横移動
                pieceOperationState.pieceHorizontalMove(MoveOperationType.R);
              },
            ),
          ),
        ],
      ),
    );
  }
}
