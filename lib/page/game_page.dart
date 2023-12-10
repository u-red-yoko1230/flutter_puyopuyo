import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_puyopuyo/material/piece_operation_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_settings.dart';
import '../controller/game_controller.dart';
import '../game_settings.dart';
import '../material/controller_menu.dart';
import '../material/controller_movement.dart';
import '../material/controller_rotation.dart';
import '../material/main_field_widget.dart';
import '../material/next_field_widget.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({
    super.key,
    required this.orientation,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ロード完了
    final ValueNotifier<bool> loadComplete = useState(false);

    // サイズ設定
    // ぷよサイズ
    final double puyoSize = AppSettings.basePuyoSize[orientation]!.r;

    // プロバイダー
    // プレイコントローラ
    final GameController playController = ref.read(gameControllerProvider);

    // 初期化
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // ゲームロジック開始
        playController.gameLogic();

        // 完了フラグ設定
        loadComplete.value = true;
      });
      return () async {};
    }, []);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: const Text('Flutter PuyoPuyo'),
        // ),
        body: Center(
          child: loadComplete.value
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ControllerMovement(orientation: orientation),
                    const SizedBox(width: 20),
                    Stack(children: [
                      MainFieldWidget(orientation: orientation),
                      PieceOperationFieldWidget(orientation: orientation),
                    ]),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: puyoSize * 3,
                      height: puyoSize * GameSettings.mainFieldYSize,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              NextFieldWidget(orientation: orientation, nextMovePosition: 1, paddingTop: 20.h, paddingBottom: 20.h),
                              NextFieldWidget(orientation: orientation, nextMovePosition: 2, paddingTop: 20.h, paddingBottom: 20.h),
                            ],
                          ),
                          Column(
                            children: [
                              ControllerMenu(orientation: orientation),
                              const Text('Erased Puyo : ${1}'),
                              const Text('Max Chains : ${2}'),
                              const Text('Score : ${'00000000'}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    ControllerRotation(orientation: orientation),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
