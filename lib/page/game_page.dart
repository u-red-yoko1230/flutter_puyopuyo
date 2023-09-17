import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/material/piece_operation_field_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../game_settings.dart';
import '../material/controller_movement.dart';
import '../material/controller_rotation.dart';
import '../material/main_field_widget.dart';
import '../material/next_field_widget.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter PuyoPuyo'),
        ),
        body: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControllerMovement(),
              SizedBox(width: 20),
              Stack(children: [
                MainFieldWidget(),
                PieceOperationFieldWidget(),
              ]),
              SizedBox(width: 20),
              SizedBox(
                width: AppSettings.puyoSize * 3,
                height: AppSettings.puyoSize * GameSettings.mainFieldYSize,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        NextFieldWidget(nextMovePosition: 0, paddingTop: 20, paddingBottom: 20),
                        NextFieldWidget(nextMovePosition: 1, paddingTop: 20, paddingBottom: 20),
                        NextFieldWidget(nextMovePosition: 2, paddingTop: 20, paddingBottom: 20),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Erased Puyo : ${1}'),
                        Text('Max Chains : ${2}'),
                        Text('Score : ${'00000000'}'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              ControllerRotation(),
            ],
          ),
        ),
      ),
    );
  }
}
