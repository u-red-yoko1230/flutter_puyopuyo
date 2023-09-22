import 'rotation_operation_type.dart';

/// 回転状態種類
enum RotationStateType {
  U,
  R,
  D,
  L,
}

/// 回転状態種類 : エクステンション
extension RotationStateTypeExtension on RotationStateType {
  RotationStateType next() {
    return RotationStateType.values[(index + 1) % RotationStateType.values.length];
  }

  RotationStateType prev() {
    return RotationStateType.values[((index == 0 ? RotationStateType.values.length : index) - 1)];
  }

  RotationStateType change(RotationOperationType rotationOperationType) {
    if (rotationOperationType == RotationOperationType.R) {
      return next();
    } else if (rotationOperationType == RotationOperationType.L) {
      return prev();
    }
    return this;
  }
}
