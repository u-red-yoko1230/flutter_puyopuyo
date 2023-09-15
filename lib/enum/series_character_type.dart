import 'puyo_shape_type.dart';

/// キャラクター種類
enum CharacterType {
  tsuArle,
}

extension CharacterTypeExtension on CharacterType {
  /// 表示マップ
  static const displayStringMap = {
    CharacterType.tsuArle: {
      'ja': 'アルル(通)',
      'en': 'Arle(Tsu)',
    },
  };

  /// ぷよ形状リスト(キャラクター別)マップ
  /// 0:I
  static const Map<CharacterType, List<int>> puyoShapeListMap = {
    CharacterType.tsuArle: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  };

  /// 連鎖ボーナスマップ
  static const Map<CharacterType, List<int>> chainBonusMap = {
    CharacterType.tsuArle: [0, 8, 16, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 480, 512, 544],
  };

  /// 表示
  String display(String locale) => displayStringMap[this]![locale]!;

  /// ぷよ形状リスト(キャラクター別)
  List<PuyoShapeType> get puyoShapeList => puyoShapeListMap[this]!.map((e) => PuyoShapeType.values[e]).toList();

  /// 連鎖ボーナス
  List<int> get chainBonus => chainBonusMap[this]!;
}
