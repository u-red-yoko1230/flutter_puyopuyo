import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_settings.dart';

class NextFieldWidget extends ConsumerWidget {
  const NextFieldWidget({
    super.key,
    this.paddingTop,
    this.paddingBottom,
  });

  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ネクストフィールド
    return Column(
      children: [
        SizedBox(height: paddingTop),
        Container(
          width: AppSettings.puyoSize * 2,
          height: AppSettings.puyoSize * 2,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: const Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          // child: Stack(children: widget),
        ),
        SizedBox(height: paddingBottom),
      ],
    );
  }
}
