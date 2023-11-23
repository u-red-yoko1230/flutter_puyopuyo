import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_settings.dart';
import '../enum/rotation_operation_type.dart';
import '../state/piece_operation_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（回転）
class ControllerRotation extends ConsumerWidget {
  const ControllerRotation({
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
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    return Container(
      width: ctrlBtnSize * 3,
      height: ctrlBtnSize * 3,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 左回転
          Positioned(
            left: 0,
            bottom: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize*1.5,
              height: ctrlBtnSize*1.5,
              icon: Icons.rotate_left,
              iconSize: ctrlBtnSize,
              onTap: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // ピース(ツモ)回転 : 左回転
                pieceOperationState.pieceRotation(RotationOperationType.L);
              },
            ),
          ),
          // 右回転
          Positioned(
            top: 0,
            right: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize*1.5,
              height: ctrlBtnSize*1.5,
              icon: Icons.rotate_right,
              iconSize: ctrlBtnSize,
              onTap: () {
                // // 操作モード : 開始時のみ要求を処理
                // if (operation.value.operationType != OperationType.start) return;

                // ピース(ツモ)回転 : 右回転
                pieceOperationState.pieceRotation(RotationOperationType.R);
              },
            ),
          ),
        ],
      ),
    );
  }
}
