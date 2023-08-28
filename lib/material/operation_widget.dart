// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../app_settings.dart';
// import '../enum/game_mode_type.dart';
// import '../enum/game_nazo_setting_type.dart';
// import '../enum/game_puyo_type.dart';
// import '../enum/game_setting_type.dart';
// import '../enum/operation_type.dart';
// import '../enum/pcs_mode_type.dart';
// import '../enum/pick_color_type.dart';
// import '../enum/puyo_piece_type.dart';
// import '../enum/puyo_type.dart';
// import '../model/puyo_drop_set.dart';
// import '../state/game_nazo_setting_info_state.dart';
// import '../state/game_setting_info_state.dart';
// import '../state/next_field_state.dart';
// import '../state/operation_history_state.dart';
// import '../state/operation_state.dart';
// import '../utility.dart';
// import '../widget/puyo_operation_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_puyopuyo/state/main_field_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../app_settings.dart';
// import '../game_settings.dart';
// import '../model/puyo_field.dart';
// import 'cross_mark_widget.dart';
// import 'puyo_widget.dart';

// /// オペレーション
// /// operation
// class OperationWidget extends ConsumerWidget {
//   const OperationWidget({
//     super.key
//   });

//   final PCSModeType pcsModeType;
//   final double basePuyoSize;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // ステート設定 : とことん
//     final gameSettingInfoCurrent = ref.read(gameSettingInfoCurrentProvider);
//     // ステート設定 : なぞなぞ
//     final gameNazoSettingInfoCurrent = ref.read(gameNazoSettingInfoCurrentProvider);
//     // ステート設定 : 共通
//     final operation = ref.watch(operationProvider);
//     final operationHistory = ref.read(operationHistoryProvider);
//     final nextField = ref.read(nextFieldProvider);

//     // ゲームぷよ種類設定
//     late final GamePuyoType gamePuyoType;

//     // 色設定
//     late final PickColorType pickColorType;

//     if (pcsModeType == PCSModeType.free) {
//       // ゲームモード設定
//       final GameModeType gameModeType = GameModeType.values.byName(gameSettingInfoCurrent.value![GameSettingType.mode]!);

//       // ゲームぷよ種類設定
//       gamePuyoType = gameModeType.getGamePuyoType();

//       // 色設定
//       pickColorType = PickColorType.values.byName(gameSettingInfoCurrent.value![GameSettingType.picksColors]!);
//     } else {
//       // ゲームぷよ種類設定
//       gamePuyoType = GamePuyoType.values.byName(gameNazoSettingInfoCurrent.value![GameNazoSettingType.mode]!);

//       // 色設定
//       pickColorType = PickColorType.five;
//     }

//     // 現在手のぷよドロップセットの取得
//     final PuyoDropSet? puyoDropSet = nextField.getPuyoDropSet(operationHistory.currentNextPosition);

//     // ぷよサイズ
//     final double dPuyoSize = basePuyoSize.minF;

//     // ウィジェットリスト
//     final List<Widget> widget = [];

//     // ドロップセットが取得できる場合
//     if (puyoDropSet != null) {
//       // 現在手のぷよ形種類の取得
//       final PuyoPieceType puyoPieceType = puyoDropSet.puyoPieceType;

//       // 現在手のぷよ種類の取得
//       final PuyoType puyoTypeParent = puyoDropSet.getPuyoTypeParent();
//       final PuyoType puyoTypePChild = puyoDropSet.getPuyoTypePChild();
//       final PuyoType puyoTypePieceO = puyoDropSet.getPuyoTypeAxis(operation.value.axisRotateType, pickColorType);

//       // ぷよオペレーションウィジェット追加
//       widget.add(
//         PuyoOperationWidget(
//           operationState: operation,
//           gamePuyoType: gamePuyoType,
//           puyoPieceType: puyoPieceType,
//           puyoTypeParent: puyoTypeParent,
//           puyoTypePChild: puyoTypePChild,
//           puyoTypePieceO: puyoTypePieceO,
//           size: dPuyoSize,
//         ),
//       );
//     }

//     // オペレーション : 開始中 のみ表示
//     return SizedBox(
//       width: dPuyoSize * AppSettings.iMainFieldX,
//       height: dPuyoSize * AppSettings.iMainFieldY,
//       child: Visibility(
//         visible: operation.value.operationType == OperationType.start,
//         maintainState: true,
//         maintainAnimation: true,
//         maintainSize: false,
//         child: Stack(children: widget),
//       ),
//     );
//   }
// }
