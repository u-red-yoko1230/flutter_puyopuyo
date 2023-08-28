/// game setup class
/// ゲーム設定クラス
class GameSettings {
  GameSettings._() {
    throw AssertionError("private Constructor");
  }

  /// メインフィールド : 横サイズ
  /// Main field : Horizontal size
  static const int mainFieldXSize = 6;

  /// メインフィールド : 縦サイズ
  /// Main field : Vertical size
  static const int mainFieldYSize = 14;

  /// 非表示メインフィールド : 縦サイズ
  /// Hide main field : Vertical size
  static const int hideMainFieldYSize = 2;

  /// 移動ステップ数
  /// Number of movement steps
  static const int numOfMoveSteps = 20;

  /// 消去可能ぷよ数
  static const int numOfErasablePuyos = 4;
}
