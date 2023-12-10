import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_settings.dart';
import '../game_settings.dart';
import '../state/main_field_state.dart';
import 'cross_mark_widget.dart';
import 'puyo_widget.dart';

/// メインフィールド
class MainFieldWidget extends HookConsumerWidget {
  const MainFieldWidget({
    super.key,
    required this.orientation,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サイズ設定
    // ぷよサイズ
    final double puyoSize = AppSettings.basePuyoSize[orientation]!.r;

    // プロバイダー
    // メインフィールド
    final MainFieldState mainFieldState = ref.watch(mainFieldStateProvider);

    // ウィジェット
    // メインフィールド : ぷよ
    final List<Widget> widgetsPuyo = [];

    // クロスマーク設定
    widgetsPuyo.add(
      Positioned(
        left: puyoSize * 2,
        top: puyoSize * ((GameSettings.mainFieldYSize - 1) - 11),
        child: CrossMarkWidget(size: puyoSize),
      ),
    );

    // メインフィールドぷよ設定
    mainFieldState.mainFieldList.asMap().forEach((x, px) {
      px.asMap().forEach((y, py) {
        widgetsPuyo.add(
          Positioned(
            left: puyoSize * x,
            top: puyoSize * ((GameSettings.mainFieldYSize - 1) - y),
            child: PuyoWidget(
              puyo: py,
              size: puyoSize,
            ),
          ),
        );
      });
    });

    // メインフィールド
    return SizedBox(
      width: puyoSize * GameSettings.mainFieldXSize,
      height: puyoSize * GameSettings.mainFieldYSize,
      child: Stack(
        children: [
          Column(
            children: [
              // 非表示メインフィールド
              Container(
                width: puyoSize * GameSettings.mainFieldXSize,
                height: puyoSize * GameSettings.hideMainFieldYSize,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
              // 表示メインフィールド
              Container(
                width: puyoSize * GameSettings.mainFieldXSize,
                height: puyoSize * (GameSettings.mainFieldYSize - GameSettings.hideMainFieldYSize),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          // ぷよの表示
          Container(
            width: puyoSize * GameSettings.mainFieldXSize,
            height: puyoSize * GameSettings.mainFieldYSize,
            color: Colors.transparent,
            child: Stack(
              children: widgetsPuyo,
            ),
          ),
        ],
      ),
    );
  }
}
