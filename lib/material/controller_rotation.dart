import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/app_settings.dart';
import 'package:flutter_puyopuyo/state/drop_set_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/play_controller.dart';
import '../enum/rotation_operation_type.dart';
import '../state/piece_operation_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（回転）
class ControllerRotation extends ConsumerWidget {
  const ControllerRotation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダー
    // プレイコントローラ
    final GameController playController = ref.read(gameControllerProvider);
    // // メインフィールド
    // final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);
    //
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    return Container(
      width: AppSettings.ctrlBtnSize * 2,
      height: AppSettings.ctrlBtnSize * 2,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 左回転
          Positioned(
            left: 0,
            bottom: 0,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.rotate_left,
              // iconSize: dIconSize,
              onTap: () {
                pieceOperationState.pieceRotation(RotationOperationType.L);
// // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // 左回転
                // operation.mainOperation(OperationRequestType.rotationLeft);
              },
            ),
          ),
          // 右回転
          Positioned(
            top: 0,
            right: 0,
            child: CustomMenuButton(
              width: AppSettings.ctrlBtnSize,
              height: AppSettings.ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.rotate_right,
              // iconSize: dIconSize,
              onTap: () {
                pieceOperationState.pieceRotation(RotationOperationType.R);
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // // 右回転
                // operation.mainOperation(OperationRequestType.rotationRight);
              },
            ),
          ),
        ],
      ),
    );
  }
}
