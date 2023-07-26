// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ControllerRotation extends ConsumerWidget {
//   const ControllerRotation({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SizedBox(
//       width: (dPuyoSize * (AppSettings.iMainFieldX)) + 20.0.minF + (dPuyoSize * (AppSettings.iMainFieldX / 2)),
//       height: (dPuyoSize * AppSettings.iMainFieldY) / 2,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           // 左移動
//           Positioned(
//             left: dPuyoSize / 4,
//             bottom: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.west,
//               iconSize: dIconSize,
//               onTap: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // 左移動
//                 operation.mainOperation(OperationRequestType.moveLeftSingle);
//               },
//             ),
//           ),
//           // クイックドロップ
//           Positioned(
//             left: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             bottom: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.north,
//               iconSize: dIconSize,
//               onTap: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // クイックドロップ
//                 operation.mainOperation(OperationRequestType.quickDrop);
//               },
//             ),
//           ),
//           // ソフトドロップ
//           Positioned(
//             left: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             bottom: dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.south,
//               iconSize: dIconSize,
//               // onTap: () => operation.mainOperation(OperationRequestType.softDrop),
//               onTapDown: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;
//                 // ソフトドロップ
//                 operation.mainOperation(OperationRequestType.softDrop);
//               },
//               onTapUp: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // 処理のキャンセル設定
//                 operation.mainOperation(OperationRequestType.softDrop, isCancel: true);
//               },
//             ),
//           ),
//           // 右移動
//           Positioned(
//             left: (dPuyoSize / 4) + dButtonSize + (dPuyoSize / 4) + dButtonSize + (dPuyoSize / 4),
//             bottom: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.east,
//               iconSize: dIconSize,
//               onTap: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // 右移動
//                 operation.mainOperation(OperationRequestType.moveRightSingle);
//               },
//             ),
//           ),
//           // 左回転
//           Positioned(
//             right: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             bottom: dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.rotate_left,
//               iconSize: dIconSize,
//               onTap: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // 左回転
//                 operation.mainOperation(OperationRequestType.rotationLeft);
//               },
//             ),
//           ),
//           // 右回転
//           Positioned(
//             right: dPuyoSize / 4,
//             bottom: dPuyoSize / 4 + dButtonSize + dPuyoSize / 4,
//             child: CustomMenuButton(
//               width: dButtonSize,
//               height: dButtonSize,
//               color: btnBackgroundColor,
//               splashColor: btnForegroundColor,
//               indicateColor: btnIndicateColor,
//               icon: Icons.rotate_right,
//               iconSize: dIconSize,
//               onTap: () {
//                 // 操作モード : 開始時のみ要求を処理
//                 if (operation.value.operationType != OperationType.start) return;

//                 // 右回転
//                 operation.mainOperation(OperationRequestType.rotationRight);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
