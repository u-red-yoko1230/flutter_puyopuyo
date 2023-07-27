import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/material/controller_movement.dart';
import 'package:flutter_puyopuyo/material/controller_rotation.dart';
import 'package:flutter_puyopuyo/material/main_field_widget.dart';
import 'package:flutter_puyopuyo/material/next_field_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';
import '../game_settings.dart';

class PlayPage extends ConsumerWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
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
            MainFieldWidget(),
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
                      NextFieldWidget(paddingTop: 20, paddingBottom: 20),
                      NextFieldWidget(paddingTop: 20, paddingBottom: 20),
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
    );
  }
}
