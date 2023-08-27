// import 'package:flutter/material.dart';
// import 'package:flutter_puyopuyo/state/main_field_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../app_settings.dart';
// import '../game_settings.dart';
// import '../model/puyo_field.dart';
// import 'cross_mark_widget.dart';
// import 'puyo_widget.dart';

// /// メインフィールドアニメーション
// class MainFieldAnimationWidget extends ConsumerWidget {
//   const MainFieldAnimationWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // ステート設定 : 共通
//     final mainFieldAnimation = ref.watch(mainFieldAnimationProvider);

//     // ぷよサイズ
//     final double dPuyoSize = basePuyoSize.minF;

//     // ウィジェット
//     List<Widget> widget = [];

//     // ウィジェット生成
//     mainFieldAnimation.value.asMap().forEach((x, px) {
//       px.asMap().forEach((y, py) {
//         widget.add(
//           Positioned(
//             left: dPuyoSize * x,
//             top: (dPuyoSize * ((AppSettings.iMainFieldY - 1) - y)) - ((dPuyoSize / AppSettings.baseDps) * py.positionYDiff),
//             child: Transform.scale(
//               scaleX: py.scaleX,
//               scaleY: py.scaleY,
//               child: PuyoWidget(
//                 puyoField: py,
//                 size: dPuyoSize,
//               ),
//             ),
//           ),
//         );
//       });
//     });

//     return SizedBox(
//       width: dPuyoSize * AppSettings.iMainFieldX,
//       height: dPuyoSize * AppSettings.iMainFieldY,
//       child: Stack(
//         children: widget,
//       ),
//     );
//   }
// }
