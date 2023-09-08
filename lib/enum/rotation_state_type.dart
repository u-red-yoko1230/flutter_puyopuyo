import 'rotation_operation_type.dart';

/// 回転状態種類
/// Rotation state type
enum RotationStateType {
  U,
  R,
  D,
  L,
  P,
}

/// 回転状態種類 : エクステンション
/// Rotation state type : Extension
extension RotationStateTypeExtension on RotationStateType {
  RotationStateType next({int period = -1}) {
    if (period < 0) period = RotationStateType.values.length - 1; // 4
    return RotationStateType.values[(index + 1) % period];
  }

  RotationStateType prev({int period = -1}) {
    if (period < 0) period = RotationStateType.values.length - 1; // 4
    return RotationStateType.values[((index == 0 ? period : index) - 1)];
  }

  RotationStateType change(RotationOperationType operationRotateDirection, {int period = -1}) {
    if (operationRotateDirection == RotationOperationType.R) {
      return next(period: period);
    } else if (operationRotateDirection == RotationOperationType.L) {
      return prev(period: period);
    }
    return this;
  }
}
