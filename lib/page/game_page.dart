import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/material/piece_operation_field_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_settings.dart';
import '../game_settings.dart';
import '../material/controller_menu.dart';
import '../material/controller_movement.dart';
import '../material/controller_rotation.dart';
import '../material/main_field_widget.dart';
import '../material/next_field_widget.dart';

class GamePage extends ConsumerWidget {
  const GamePage({
    super.key,
    required this.orientation,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サイズ設定
    // ぷよサイズ
    final double puyoSize = AppSettings.basePuyoSize[orientation]!.r;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: const Text('Flutter PuyoPuyo'),
        // ),
        body: Center(
          child: Row(
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
                        Text('Erased Puyo : ${1}'),
                        Text('Max Chains : ${2}'),
                        Text('Score : ${'00000000'}'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ControllerRotation(orientation: orientation),
            ],
          ),
        ),
      ),
    );
  }
}
