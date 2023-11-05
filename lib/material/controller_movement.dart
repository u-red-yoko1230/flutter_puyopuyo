import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/enum/player_action_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_settings.dart';
import '../controller/game_controller.dart';
import '../enum/move_operation_type.dart';
import '../state/main_field_state.dart';
import '../state/piece_operation_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（移動）
class ControllerMovement extends ConsumerWidget {
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
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);
    //
    // final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
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
            left: ctrlBtnSize,
            top: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.north,
              // iconSize: dIconSize,
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
              // color: btnBackgroundColor,
              // splashColor: btnForegroundColor,
              // indicateColor: btnIndicateColor,
              icon: Icons.south,
              // iconSize: dIconSize,
              // onTap: () => operation.mainOperation(OperationRequestType.softDrop),
              onTapDown: () {
                playController.fastFall(true);
              },
              onTapUp: () {
                playController.fastFall(false);
              },
              // onTap: () {
              //   mainFieldState.test2();
              // },
            ),
          ),
          // 右移動
          Positioned(
            right: 0,
            top: ctrlBtnSize,
            child: CustomMenuButton(
              width: ctrlBtnSize,
              height: ctrlBtnSize,
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
