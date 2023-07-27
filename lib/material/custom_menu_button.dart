import 'package:flutter/material.dart';

/// カスタムメニューボタン
class CustomMenuButton extends SizedBox {
  CustomMenuButton({
    super.key,
    super.width,
    super.height,
    Color? color,
    Color? splashColor,
    Color? indicateColor,
    Widget? widget,
    IconData? icon,
    double? iconSize,
    String? text,
    double? fontSize,
    String? fontFamily,
    Function()? onTap,
    Function()? onTapUp,
    Function()? onTapDown,
  }) : super(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: splashColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () => onTap?.call(),
                  onTapUp: (_) => onTapUp?.call(),
                  onTapDown: (_) => onTapDown?.call(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget ?? const SizedBox(),
                      icon != null ? Icon(icon, color: indicateColor, size: iconSize) : const SizedBox(),
                      text != null ? Text(text, style: TextStyle(color: indicateColor, fontSize: fontSize, fontFamily: fontFamily)) : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
}
