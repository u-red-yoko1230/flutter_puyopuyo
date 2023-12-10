import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_settings.dart';
import '../controller/game_controller.dart';
import '../state/drop_set_state.dart';
import '../state/main_field_state.dart';
import 'custom_menu_button.dart';

/// コントローラー（メニュー）
class ControllerMenu extends HookConsumerWidget {
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
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);

    return Container(
      width: ctrlBtnSize * 4,
      height: ctrlBtnSize * 2,
      color: Colors.amberAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ゲーム終了
          Positioned(
            left: 0,
            bottom: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize * 2,
              height: ctrlBtnSize * 2,
              icon: Icons.stop,
              iconSize: ctrlBtnSize,
              onTap: () {
              },
            ),
          ),
          // ゲーム開始
          Positioned(
            right: 0,
            bottom: 0,
            child: CustomMenuButton(
              width: ctrlBtnSize * 2,
              height: ctrlBtnSize * 2,
              icon: Icons.play_arrow,
              iconSize: ctrlBtnSize,
              onTap: () {
                // メインフィールドリセット
                mainFieldState.reset();
                // 配ぷよ(ドロップセット)リストリセット
                dropSetState.reset();
                // プレイコントローラゲームロジック
                playController.gameLogic();
              },
            ),
          ),
        ],
      ),
    );
  }
}
