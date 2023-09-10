import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_puyopuyo/page/game_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// スプライトイメージデータ
late ui.Image image;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // イメージデータのロード
  final ByteData byteData = await rootBundle.load("assets/images/pcs_sprite.png");
  final imageList = Uint8List.view(byteData.buffer);
  image = await decodeImageFromList(imageList);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PuyoPuyo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GamePage(),
    );
  }
}
