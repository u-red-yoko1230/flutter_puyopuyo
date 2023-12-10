import 'package:flutter/material.dart';

/// アプリ設定クラス
class AppSettings {
  AppSettings._() {
    throw AssertionError("private Constructor");
  }

  /// スクリーンサイズ : 幅
  static const double baseScreenSizeWidth = 900.0;

  /// スクリーンサイズ : 高さ
  static const double baseScreenSizeHeight = 1600.0;

  /// ぷよサイズ
  static const Map<Orientation, double> basePuyoSize = {
    Orientation.portrait: 90.0,
    Orientation.landscape: 110.0,
  };

  /// コントローラーボタンサイズ
  static const Map<Orientation, double> baseCtrlBtnSize = {
    Orientation.portrait: 50.0,
    Orientation.landscape: 50.0,
  };

  /// ゲーム画像座標設定
  static final spriteSourceRect = {
    "puyo_r_0000.png": const Rect.fromLTWH(0, 0, 50, 50),
    "puyo_r_0100.png": const Rect.fromLTWH(50, 0, 50, 50),
    "puyo_r_0101.png": const Rect.fromLTWH(100, 0, 50, 50),
    "puyo_r_0001.png": const Rect.fromLTWH(150, 0, 50, 50),
    "puyo_r_0010.png": const Rect.fromLTWH(0, 50, 50, 50),
    "puyo_r_0110.png": const Rect.fromLTWH(50, 50, 50, 50),
    "puyo_r_0111.png": const Rect.fromLTWH(100, 50, 50, 50),
    "puyo_r_0011.png": const Rect.fromLTWH(150, 50, 50, 50),
    "puyo_r_1010.png": const Rect.fromLTWH(0, 100, 50, 50),
    "puyo_r_1110.png": const Rect.fromLTWH(50, 100, 50, 50),
    "puyo_r_1111.png": const Rect.fromLTWH(100, 100, 50, 50),
    "puyo_r_1011.png": const Rect.fromLTWH(150, 100, 50, 50),
    "puyo_r_1000.png": const Rect.fromLTWH(0, 150, 50, 50),
    "puyo_r_1100.png": const Rect.fromLTWH(50, 150, 50, 50),
    "puyo_r_1101.png": const Rect.fromLTWH(100, 150, 50, 50),
    "puyo_r_1001.png": const Rect.fromLTWH(150, 150, 50, 50),
    "puyo_g_0000.png": const Rect.fromLTWH(0, 200, 50, 50),
    "puyo_g_0100.png": const Rect.fromLTWH(50, 200, 50, 50),
    "puyo_g_0101.png": const Rect.fromLTWH(100, 200, 50, 50),
    "puyo_g_0001.png": const Rect.fromLTWH(150, 200, 50, 50),
    "puyo_g_0010.png": const Rect.fromLTWH(0, 250, 50, 50),
    "puyo_g_0110.png": const Rect.fromLTWH(50, 250, 50, 50),
    "puyo_g_0111.png": const Rect.fromLTWH(100, 250, 50, 50),
    "puyo_g_0011.png": const Rect.fromLTWH(150, 250, 50, 50),
    "puyo_g_1010.png": const Rect.fromLTWH(0, 300, 50, 50),
    "puyo_g_1110.png": const Rect.fromLTWH(50, 300, 50, 50),
    "puyo_g_1111.png": const Rect.fromLTWH(100, 300, 50, 50),
    "puyo_g_1011.png": const Rect.fromLTWH(150, 300, 50, 50),
    "puyo_g_1000.png": const Rect.fromLTWH(0, 350, 50, 50),
    "puyo_g_1100.png": const Rect.fromLTWH(50, 350, 50, 50),
    "puyo_g_1101.png": const Rect.fromLTWH(100, 350, 50, 50),
    "puyo_g_1001.png": const Rect.fromLTWH(150, 350, 50, 50),
    "puyo_b_0000.png": const Rect.fromLTWH(0, 400, 50, 50),
    "puyo_b_0100.png": const Rect.fromLTWH(50, 400, 50, 50),
    "puyo_b_0101.png": const Rect.fromLTWH(100, 400, 50, 50),
    "puyo_b_0001.png": const Rect.fromLTWH(150, 400, 50, 50),
    "puyo_b_0010.png": const Rect.fromLTWH(0, 450, 50, 50),
    "puyo_b_0110.png": const Rect.fromLTWH(50, 450, 50, 50),
    "puyo_b_0111.png": const Rect.fromLTWH(100, 450, 50, 50),
    "puyo_b_0011.png": const Rect.fromLTWH(150, 450, 50, 50),
    "puyo_b_1010.png": const Rect.fromLTWH(0, 500, 50, 50),
    "puyo_b_1110.png": const Rect.fromLTWH(50, 500, 50, 50),
    "puyo_b_1111.png": const Rect.fromLTWH(100, 500, 50, 50),
    "puyo_b_1011.png": const Rect.fromLTWH(150, 500, 50, 50),
    "puyo_b_1000.png": const Rect.fromLTWH(0, 550, 50, 50),
    "puyo_b_1100.png": const Rect.fromLTWH(50, 550, 50, 50),
    "puyo_b_1101.png": const Rect.fromLTWH(100, 550, 50, 50),
    "puyo_b_1001.png": const Rect.fromLTWH(150, 550, 50, 50),
    "puyo_y_0000.png": const Rect.fromLTWH(0, 600, 50, 50),
    "puyo_y_0100.png": const Rect.fromLTWH(50, 600, 50, 50),
    "puyo_y_0101.png": const Rect.fromLTWH(100, 600, 50, 50),
    "puyo_y_0001.png": const Rect.fromLTWH(150, 600, 50, 50),
    "puyo_y_0010.png": const Rect.fromLTWH(0, 650, 50, 50),
    "puyo_y_0110.png": const Rect.fromLTWH(50, 650, 50, 50),
    "puyo_y_0111.png": const Rect.fromLTWH(100, 650, 50, 50),
    "puyo_y_0011.png": const Rect.fromLTWH(150, 650, 50, 50),
    "puyo_y_1010.png": const Rect.fromLTWH(0, 700, 50, 50),
    "puyo_y_1110.png": const Rect.fromLTWH(50, 700, 50, 50),
    "puyo_y_1111.png": const Rect.fromLTWH(100, 700, 50, 50),
    "puyo_y_1011.png": const Rect.fromLTWH(150, 700, 50, 50),
    "puyo_y_1000.png": const Rect.fromLTWH(0, 750, 50, 50),
    "puyo_y_1100.png": const Rect.fromLTWH(50, 750, 50, 50),
    "puyo_y_1101.png": const Rect.fromLTWH(100, 750, 50, 50),
    "puyo_y_1001.png": const Rect.fromLTWH(150, 750, 50, 50),
    "puyo_p_0000.png": const Rect.fromLTWH(0, 800, 50, 50),
    "puyo_p_0100.png": const Rect.fromLTWH(50, 800, 50, 50),
    "puyo_p_0101.png": const Rect.fromLTWH(100, 800, 50, 50),
    "puyo_p_0001.png": const Rect.fromLTWH(150, 800, 50, 50),
    "puyo_p_0010.png": const Rect.fromLTWH(0, 850, 50, 50),
    "puyo_p_0110.png": const Rect.fromLTWH(50, 850, 50, 50),
    "puyo_p_0111.png": const Rect.fromLTWH(100, 850, 50, 50),
    "puyo_p_0011.png": const Rect.fromLTWH(150, 850, 50, 50),
    "puyo_p_1010.png": const Rect.fromLTWH(0, 900, 50, 50),
    "puyo_p_1110.png": const Rect.fromLTWH(50, 900, 50, 50),
    "puyo_p_1111.png": const Rect.fromLTWH(100, 900, 50, 50),
    "puyo_p_1011.png": const Rect.fromLTWH(150, 900, 50, 50),
    "puyo_p_1000.png": const Rect.fromLTWH(0, 950, 50, 50),
    "puyo_p_1100.png": const Rect.fromLTWH(50, 950, 50, 50),
    "puyo_p_1101.png": const Rect.fromLTWH(100, 950, 50, 50),
    "puyo_p_1001.png": const Rect.fromLTWH(150, 950, 50, 50),
    "puyo_n_0000.png": const Rect.fromLTWH(700, 0, 50, 50),
    "puyo_o_0000.png": const Rect.fromLTWH(700, 50, 50, 50),
    "puyo_o_0001.png": const Rect.fromLTWH(700, 250, 50, 50),
    "puyo_o_0006.png": const Rect.fromLTWH(700, 300, 50, 50),
    "puyo_o_0030.png": const Rect.fromLTWH(700, 350, 50, 50),
    "puyo_o_0180.png": const Rect.fromLTWH(700, 400, 50, 50),
    "puyo_o_0360.png": const Rect.fromLTWH(700, 450, 50, 50),
    "puyo_o_0720.png": const Rect.fromLTWH(700, 500, 50, 50),
    "puyo_o_1440.png": const Rect.fromLTWH(700, 550, 50, 50),
    "puyo_chain_no_1.png": const Rect.fromLTWH(800, 0, 20, 50),
    "puyo_chain_no_2.png": const Rect.fromLTWH(820, 0, 20, 50),
    "puyo_chain_no_3.png": const Rect.fromLTWH(840, 0, 20, 50),
    "puyo_chain_no_4.png": const Rect.fromLTWH(860, 0, 20, 50),
    "puyo_chain_no_5.png": const Rect.fromLTWH(880, 0, 20, 50),
    "puyo_chain_no_6.png": const Rect.fromLTWH(900, 0, 20, 50),
    "puyo_chain_no_7.png": const Rect.fromLTWH(920, 0, 20, 50),
    "puyo_chain_no_8.png": const Rect.fromLTWH(940, 0, 20, 50),
    "puyo_chain_no_9.png": const Rect.fromLTWH(960, 0, 20, 50),
    "puyo_chain_no_0.png": const Rect.fromLTWH(980, 0, 20, 50),
    "puyo_chain_str.png": const Rect.fromLTWH(800, 50, 200, 50),
    "all_clear.png": const Rect.fromLTWH(700, 600, 300, 100),
    "game_over.png": const Rect.fromLTWH(700, 700, 300, 100),
    "success.png": const Rect.fromLTWH(700, 800, 300, 100),
    "cross_mark.png": const Rect.fromLTWH(750, 0, 50, 50),
  };
}
