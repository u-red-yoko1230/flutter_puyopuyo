import 'enum/puyo_type.dart';

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
  static const double numOfMoveSteps = 20.0;

  /// 消去可能ぷよ数
  static const int numOfErasablePuyos = 4;

  /// ループあたりの手数
  static const int numOfMovesPerLoop = 128;

  /// 接地待機時間
  static const double groundStandbyTime = 10.0;

  /// 自由落下速度(μs)
  static const int freeFallSpeed = 500000;

  /// 高速落下速度(μs)
  static const int fastFallSpeed = 50000;

  /// ピース(ツモ)横移動 : アニメーション : フレーム数
  static const int pieceHorizontalMoveAnimationNumOfFrames = 1;

  /// ピース(ツモ)横移動 : アニメーション : 周期時間(μs)
  static const int pieceHorizontalMoveAnimationCycleTime = 30000;

  /// ぷよ(色)リスト
  static const List<PuyoType> puyoColorList = [
    PuyoType.r,
    PuyoType.g,
    PuyoType.b,
    PuyoType.y,
    PuyoType.p,
  ];

  /// ぷよ(おじゃま)リスト
  static const List<PuyoType> puyoOjamaList = [
    PuyoType.o,
  ];
}
