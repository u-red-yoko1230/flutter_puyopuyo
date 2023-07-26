import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../game_settings.dart';

/// メインフィールド
/// main field
class MainFieldWidget extends ConsumerWidget {
  const MainFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // メインフィールド
    // main field
    return SizedBox(
      width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
      height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
      child: Stack(
        children: [
          Column(
            children: [
              // 非表示メインフィールド
              // hidden main field
              Container(
                width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
                height: AppSettings.puyoSize * GameSettings.hiddenMainFieldYSize,
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
              // Display main field
              Container(
                width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
                height: AppSettings.puyoSize * (GameSettings.mainFieldYSize - GameSettings.hiddenMainFieldYSize),
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
          // Display of Puyo
          Container(
            width: AppSettings.puyoSize * GameSettings.mainFieldXSize,
            height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
            color: Colors.transparent,
            // child: Stack(
            //   children: widget,
            // ),
          ),
        ],
      ),
    );
  }
}
