// import 'dart:ui';

// import 'package:flutter_puyopuyo/model/puyo_piece.dart';

// import '../app_settings.dart';
// import 'puyo_piece_copy.dart';

// /// ぷよ（フィールド）
// /// Puyo (field)
// class PuyoField extends PuyoPieceCopy {
//   PuyoField({
//     super.puyoType,
//     this.justDropped = false,
//     this.connectedTop = false,
//     this.connectedRight = false,
//     this.connectedBottom = false,
//     this.connectedLeft = false,
//   }) : super();

//   /// 落下状態
//   bool justDropped;

//   /// 結合：上
//   bool connectedTop;

//   /// 結合：右
//   bool connectedRight;

//   /// 結合：下
//   bool connectedBottom;

//   /// 結合：左
//   bool connectedLeft;

//   @override

//   /// イメージ取得
//   Rect getSpriteSourceRect() {
//     return AppSettings.spriteSourceRect[
//         "puyo_${puyoType.name}_${connectedTop ? '1' : '0'}${connectedRight ? '1' : '0'}${connectedBottom ? '1' : '0'}${connectedLeft ? '1' : '0'}.png"]!;
//   }
// }
