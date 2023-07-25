import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayPage extends ConsumerWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter PuyoPuyo'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 50,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
