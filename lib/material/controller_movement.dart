import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/app_settings.dart';
import 'package:flutter_puyopuyo/enum/move_operation_type.dart';
import 'package:flutter_puyopuyo/enum/rotation_operation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/play_controller.dart';
import '../state/drop_set_state.dart';
import '../state/main_field_state.dart';
import '../state/piece_operation_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（移動）
class ControllerMovement extends ConsumerWidget {
  const ControllerMovement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダー
    // プレイコントローラ
    final GameController playController = ref.read(gameControllerProvider);
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);
    //
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    return Container(
      width: AppSettings.ctrlBtnSize * 3,
      height: AppSettings.ctrlBtnSize * 3,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 左移動
          Positioned(
            left: 0,
            top: AppSettings.ctrlBtnSize,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.west,
              // iconSize: dIconSize,
              onTap: () {
                pieceOperationState.pieceHorizontalMove(MoveOperationType.L);
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // 左移動
                // operation.mainOperation(OperationRequestType.moveLeftSingle);
              },
            ),
          ),
          // クイックドロップ
          Positioned(
            left: AppSettings.ctrlBtnSize,
            top: 0,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.north,
              // iconSize: dIconSize,
              onTap: () {
                mainFieldState.reset();
                dropSetState.reset();
                playController.gameLogic();

                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // クイックドロップ
                // operation.mainOperation(OperationRequestType.quickDrop);
              },
            ),
          ),
          // ソフトドロップ
          Positioned(
            left: AppSettings.ctrlBtnSize,
            bottom: 0,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.south,
              // iconSize: dIconSize,
              // onTap: () => operation.mainOperation(OperationRequestType.softDrop),
              onTapDown: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;
                // // ソフトドロップ
                // operation.mainOperation(OperationRequestType.softDrop);
              },
              onTapUp: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // 処理のキャンセル設定
                // operation.mainOperation(OperationRequestType.softDrop, isCancel: true);
              },
            ),
          ),
          // 右移動
          Positioned(
            right: 0,
            top: AppSettings.ctrlBtnSize,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.east,
              // iconSize: dIconSize,
              onTap: () {
                pieceOperationState.pieceHorizontalMove(MoveOperationType.R);
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // 右移動
                // operation.mainOperation(OperationRequestType.moveRightSingle);
              },
            ),
          ),
        ],
      ),
    );
  }
}
