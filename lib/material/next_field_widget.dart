import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../enum/puyo_shape_type.dart';
import '../model/drop_set.dart';
import '../model/puyo.dart';
import '../state/drop_set_state.dart';
import '../state/piece_operation_state.dart';
import 'puyo_widget.dart';

class NextFieldWidget extends ConsumerWidget {
  const NextFieldWidget({
    super.key,
    required this.nextMovePosition,
    this.paddingTop,
    this.paddingBottom,
  });

  final int nextMovePosition;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダー
    // ピース(ツモ)操作状態
    final PieceOperationState pieceOperationState = ref.watch(pieceOperationStateProvider);
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.watch(dropSetStateProvider);

    // 指定ネクストのドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(pieceOperationState.currentHandPosition + nextMovePosition);

    // ウィジェット
    // ネクストフィールド : ぷよ
    final List<Widget> widgetsPuyo = [];

    // ドロップセットが取得できる場合
    if (dropSet != null) {
      // ぷよ形状の取得
      final PuyoShapeType puyoShapeType = dropSet.puyoShapeType;
      // ぷよ種類の取得(軸)
      final Puyo puyoAxis = Puyo(puyoType: dropSet.getPuyoTypeAxis());
      // ぷよ種類の取得(子)
      final Puyo puyoChild = Puyo(puyoType: dropSet.getPuyoTypeChild());

      // ぷよ形状別設定
      switch (puyoShapeType) {
        case PuyoShapeType.I:
          widgetsPuyo.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    PuyoWidget(
                      puyo: puyoChild,
                      size: AppSettings.puyoSize,
                    ),
                    PuyoWidget(
                      puyo: puyoAxis,
                      size: AppSettings.puyoSize,
                    ),
                  ],
                ),
              ],
            ),
          );
          // // 軸
          // widgetsPuyo.add(
          //   Positioned(
          //     // left: 0 + (dPuyoSize / 8) + (dPuyoSize / 2),
          //     // top: dPuyoSize + (dPuyoSize / 8),
          //     child: PuyoWidget(
          //       puyoPiece: puyoPieceAxis,
          //       size: AppSettings.puyoSize,
          //     ),
          //   ),
          // );
          // // 子
          // widgetsPuyo.add(
          //   Positioned(
          //     // left: 0 + (dPuyoSize / 8) + (dPuyoSize / 2),
          //     // top: 0 + (dPuyoSize / 8),
          //     child: PuyoWidget(
          //       puyoPiece: puyoPieceChild,
          //       size: AppSettings.puyoSize,
          //     ),
          //   ),
          // );
          break;
        default:
          break;
      }
    }

    // ネクストフィールド
    return Column(
      children: [
        SizedBox(height: paddingTop),
        Container(
          width: AppSettings.puyoSize * 2,
          height: AppSettings.puyoSize * 2,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: const Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Stack(children: widgetsPuyo),
        ),
        SizedBox(height: paddingBottom),
      ],
    );
  }
}
