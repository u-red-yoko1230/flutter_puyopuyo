/// 色数種類
enum NumOfColorsType {
  three,
  four,
  five,
}

/// 色数種類：エクステンション
extension NumOfColorsTypeExtension on NumOfColorsType {
  /// 値マップ
  static const valueMap = {
    NumOfColorsType.three: 3,
    NumOfColorsType.four: 4,
    NumOfColorsType.five: 5,
  };

  /// 表示マップ
  static const displayMap = {
    NumOfColorsType.three: {
      'ja': '３色',
      'en': '3 colors',
    },
    NumOfColorsType.four: {
      'ja': '４色',
      'en': '4 colors',
    },
    NumOfColorsType.five: {
      'ja': '５色',
      'en': '5 colors',
    },
  };

  /// 値
  int get value => valueMap[this]!;

  /// 表示
  String display(String locale) => displayMap[this]![locale]!;
}
