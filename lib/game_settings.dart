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
  static const int mainFieldYSize = 13;

  /// 非表示メインフィールド : 縦サイズ
  /// Hide main field : Vertical size
  static const int hiddenMainFieldYSize = 1;
}