import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../game_settings.dart';
import '../state/main_field_state.dart';
import 'cross_mark_widget.dart';
import 'puyo_widget.dart';

/// メインフィールド
class MainFieldWidget extends ConsumerWidget {
  const MainFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダー
    // メインフィールド
    final MainFieldState mainFieldState = ref.watch(mainFieldStateProvider);

    // ウィジェット
    // メインフィールド : ぷよ
    final List<Widget> widgetsPuyo = [];

    // クロスマーク設定
    widgetsPuyo.add(
      const Positioned(
        left: AppSettings.puyoSize * 2,
        top: AppSettings.puyoSize * ((GameSettings.mainFieldYSize - 1) - 11),
        child: CrossMarkWidget(size: AppSettings.puyoSize),
      ),
    );

    // メインフィールドぷよ設定
    mainFieldState.mainFieldList.asMap().forEach((x, px) {
      px.asMap().forEach((y, py) {
        widgetsPuyo.add(
          Positioned(
            left: AppSettings.puyoSize * x,
            top: AppSettings.puyoSize * ((GameSettings.mainFieldYSize - 1) - y),
            child: PuyoWidget(
              puyo: py,
              size: AppSettings.puyoSize,
            ),
          ),
        );
      });
    });

    // メインフィールド
    return SizedBox(
      width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
      height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
      child: Stack(
        children: [
          Column(
            children: [
              // 非表示メインフィールド
              Container(
                width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
                height: AppSettings.puyoSize * GameSettings.hideMainFieldYSize,
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
                width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
                height: AppSettings.puyoSize * (GameSettings.mainFieldYSize - GameSettings.hideMainFieldYSize),
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
            width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
            height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
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
