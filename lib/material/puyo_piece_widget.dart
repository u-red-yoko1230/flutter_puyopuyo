// import 'package:flutter/material.dart';
// import 'package:flutter_puyopuyo/model/piece_operation.dart';

// import '../enum/puyo_shape_type.dart';
// import '../model/puyo.dart';
// import '../sprite_painter.dart';

// /// ぷよピース(ツモ)
// class PuyoPieceWidget extends StatelessWidget {
//   const PuyoPieceWidget({
//     super.key,
//     required this.pieceOperation,
//     required this.puyoShapeType,
//     required this.puyoAxis,
//     required this.puyoChild,
//     required this.size,
//     this.opacity = 1.0,
//   }) : super();

//   final PieceOperation pieceOperation;
//   final PuyoShapeType puyoShapeType;
//   final Puyo puyoAxis;
//   final Puyo puyoChild;
//   final double size;
//   final double opacity;

//   @override
//   Widget build(BuildContext context) {
//     // ウィジェット
//     // ぷよピース(ツモ) : ぷよ
//     final List<Widget> widgetsPuyo = [];

//     // ぷよ形状別設定
//     switch (puyoShapeType) {
//       case PuyoShapeType.I:
//         widgetsPuyo.add(
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   PuyoWidget(
//                     puyo: puyoAxis,
//                     size: AppSettings.puyoSize,
//                   ),
//                   PuyoWidget(
//                     puyo: puyoChild,
//                     size: AppSettings.puyoSize,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//         // // 軸
//         // widgetsPuyo.add(
//         //   Positioned(
//         //     // left: 0 + (dPuyoSize / 8) + (dPuyoSize / 2),
//         //     // top: dPuyoSize + (dPuyoSize / 8),
//         //     child: PuyoWidget(
//         //       puyoPiece: puyoPieceAxis,
//         //       size: AppSettings.puyoSize,
//         //     ),
//         //   ),
//         // );
//         // // 子
//         // widgetsPuyo.add(
//         //   Positioned(
//         //     // left: 0 + (dPuyoSize / 8) + (dPuyoSize / 2),
//         //     // top: 0 + (dPuyoSize / 8),
//         //     child: PuyoWidget(
//         //       puyoPiece: puyoPieceChild,
//         //       size: AppSettings.puyoSize,
//         //     ),
//         //   ),
//         // );
//         break;
//       default:
//         break;
//     }

//     return Opacity(
//       opacity: opacity,
//       child: SizedBox(
//         width: size,
//         height: size,
//         child: CustomPaint(
//           painter: SpritePainter(puyo.getSpriteSourceRect()),
//         ),
//       ),
//     );
//   }
// }
