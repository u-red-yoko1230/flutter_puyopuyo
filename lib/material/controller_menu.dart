import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_settings.dart';
import '../controller/game_controller.dart';
import '../state/drop_set_state.dart';
import '../state/main_field_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（メニュー）
class ControllerMenu extends ConsumerWidget {
  const ControllerMenu({
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

    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    // final PieceOperationState pieceOperationState = ref.read(pieceOperationStateProvider.notifier);

    return Container(
      width: ctrlBtnSize * 2,
      height: ctrlBtnSize * 1,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
//           // 左回転
//           Positioned(
//             left: 0,
//             bottom: 0,
//             child: CustomMenuButton(
//               width: ctrlBtnSize,
//               height: ctrlBtnSize,
//               // color: btnBackgroundColor,
//               // splashColor: btnForegroundColor,
//               // indicateColor: btnIndicateColor,
//               icon: Icons.stop,
//               // iconSize: dIconSize,
//               onTap: () {
//                 // pieceOperationState.pieceRotation(RotationOperationType.L);
// // // 操作モード : 開始時のみ要求を処理
//                 // if (operation.value.operationType != OperationType.start) return;

//                 // // 左回転
//                 // operation.mainOperation(OperationRequestType.rotationLeft);
//               },
//             ),
//           ),
          // // 右回転
          // Positioned(
          //   right: 0,
          //   bottom: 0,
          //   child: CustomMenuButton(
          //     width: ctrlBtnSize,
          //     height: ctrlBtnSize,
          //     // color: btnBackgroundColor,
          //     // splashColor: btnForegroundColor,
          //     // indicateColor: btnIndicateColor,
          //     icon: Icons.play_arrow,
          //     // iconSize: dIconSize,
          //     onTap: () {
          //       mainFieldState.reset();
          //       dropSetState.reset();
          //       playController.gameLogic();
          //       // pieceOperationState.pieceRotation(RotationOperationType.R);
          //       // // 操作モード : 開始時のみ要求を処理
          //       // if (operation.value.operationType != OperationType.start) return;

          //       // // 右回転
          //       // operation.mainOperation(OperationRequestType.rotationRight);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
