import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/app_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_menu_button.dart';

class ControllerMovement extends ConsumerWidget {
  const ControllerMovement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
