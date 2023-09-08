// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PieceOperation {
  /// 軸の位置 : X
  /// Axis position : X
  double get axisPositionX => throw _privateConstructorUsedError;

  /// 軸の位置 : Y
  /// Axis position : Y
  double get axisPositionY => throw _privateConstructorUsedError;

  /// 回転状態種類
  /// Rotation state type
  RotationStateType get rotationStateType => throw _privateConstructorUsedError;

  /// 回転角度
  /// Rotation degree
  double get rotationDegree => throw _privateConstructorUsedError;

  /// クイックターンフラグ
  /// quick-turn flag
  bool get quickTurnFlag => throw _privateConstructorUsedError;

  /// 接地時間
  /// Grounding Time
  double get groundingTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PieceOperationCopyWith<PieceOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceOperationCopyWith<$Res> {
  factory $PieceOperationCopyWith(
          PieceOperation value, $Res Function(PieceOperation) then) =
      _$PieceOperationCopyWithImpl<$Res, PieceOperation>;
  @useResult
  $Res call(
      {double axisPositionX,
      double axisPositionY,
      RotationStateType rotationStateType,
      double rotationDegree,
      bool quickTurnFlag,
      double groundingTime});
}

/// @nodoc
class _$PieceOperationCopyWithImpl<$Res, $Val extends PieceOperation>
    implements $PieceOperationCopyWith<$Res> {
  _$PieceOperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? axisPositionX = null,
    Object? axisPositionY = null,
    Object? rotationStateType = null,
    Object? rotationDegree = null,
    Object? quickTurnFlag = null,
    Object? groundingTime = null,
  }) {
    return _then(_value.copyWith(
      axisPositionX: null == axisPositionX
          ? _value.axisPositionX
          : axisPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      axisPositionY: null == axisPositionY
          ? _value.axisPositionY
          : axisPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      rotationStateType: null == rotationStateType
          ? _value.rotationStateType
          : rotationStateType // ignore: cast_nullable_to_non_nullable
              as RotationStateType,
      rotationDegree: null == rotationDegree
          ? _value.rotationDegree
          : rotationDegree // ignore: cast_nullable_to_non_nullable
              as double,
      quickTurnFlag: null == quickTurnFlag
          ? _value.quickTurnFlag
          : quickTurnFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      groundingTime: null == groundingTime
          ? _value.groundingTime
          : groundingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PieceOperationCopyWith<$Res>
    implements $PieceOperationCopyWith<$Res> {
  factory _$$_PieceOperationCopyWith(
          _$_PieceOperation value, $Res Function(_$_PieceOperation) then) =
      __$$_PieceOperationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double axisPositionX,
      double axisPositionY,
      RotationStateType rotationStateType,
      double rotationDegree,
      bool quickTurnFlag,
      double groundingTime});
}

/// @nodoc
class __$$_PieceOperationCopyWithImpl<$Res>
    extends _$PieceOperationCopyWithImpl<$Res, _$_PieceOperation>
    implements _$$_PieceOperationCopyWith<$Res> {
  __$$_PieceOperationCopyWithImpl(
      _$_PieceOperation _value, $Res Function(_$_PieceOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? axisPositionX = null,
    Object? axisPositionY = null,
    Object? rotationStateType = null,
    Object? rotationDegree = null,
    Object? quickTurnFlag = null,
    Object? groundingTime = null,
  }) {
    return _then(_$_PieceOperation(
      axisPositionX: null == axisPositionX
          ? _value.axisPositionX
          : axisPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      axisPositionY: null == axisPositionY
          ? _value.axisPositionY
          : axisPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      rotationStateType: null == rotationStateType
          ? _value.rotationStateType
          : rotationStateType // ignore: cast_nullable_to_non_nullable
              as RotationStateType,
      rotationDegree: null == rotationDegree
          ? _value.rotationDegree
          : rotationDegree // ignore: cast_nullable_to_non_nullable
              as double,
      quickTurnFlag: null == quickTurnFlag
          ? _value.quickTurnFlag
          : quickTurnFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      groundingTime: null == groundingTime
          ? _value.groundingTime
          : groundingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PieceOperation extends _PieceOperation {
  const _$_PieceOperation(
      {this.axisPositionX = GameSettings.numOfMoveSteps * 2.0,
      this.axisPositionY = GameSettings.numOfMoveSteps * 1.5,
      this.rotationStateType = RotationStateType.U,
      this.rotationDegree = 0.0,
      this.quickTurnFlag = false,
      this.groundingTime = 0.0})
      : super._();

  /// 軸の位置 : X
  /// Axis position : X
  @override
  @JsonKey()
  final double axisPositionX;

  /// 軸の位置 : Y
  /// Axis position : Y
  @override
  @JsonKey()
  final double axisPositionY;

  /// 回転状態種類
  /// Rotation state type
  @override
  @JsonKey()
  final RotationStateType rotationStateType;

  /// 回転角度
  /// Rotation degree
  @override
  @JsonKey()
  final double rotationDegree;

  /// クイックターンフラグ
  /// quick-turn flag
  @override
  @JsonKey()
  final bool quickTurnFlag;

  /// 接地時間
  /// Grounding Time
  @override
  @JsonKey()
  final double groundingTime;

  @override
  String toString() {
    return 'PieceOperation(axisPositionX: $axisPositionX, axisPositionY: $axisPositionY, rotationStateType: $rotationStateType, rotationDegree: $rotationDegree, quickTurnFlag: $quickTurnFlag, groundingTime: $groundingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PieceOperation &&
            (identical(other.axisPositionX, axisPositionX) ||
                other.axisPositionX == axisPositionX) &&
            (identical(other.axisPositionY, axisPositionY) ||
                other.axisPositionY == axisPositionY) &&
            (identical(other.rotationStateType, rotationStateType) ||
                other.rotationStateType == rotationStateType) &&
            (identical(other.rotationDegree, rotationDegree) ||
                other.rotationDegree == rotationDegree) &&
            (identical(other.quickTurnFlag, quickTurnFlag) ||
                other.quickTurnFlag == quickTurnFlag) &&
            (identical(other.groundingTime, groundingTime) ||
                other.groundingTime == groundingTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, axisPositionX, axisPositionY,
      rotationStateType, rotationDegree, quickTurnFlag, groundingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PieceOperationCopyWith<_$_PieceOperation> get copyWith =>
      __$$_PieceOperationCopyWithImpl<_$_PieceOperation>(this, _$identity);
}

abstract class _PieceOperation extends PieceOperation {
  const factory _PieceOperation(
      {final double axisPositionX,
      final double axisPositionY,
      final RotationStateType rotationStateType,
      final double rotationDegree,
      final bool quickTurnFlag,
      final double groundingTime}) = _$_PieceOperation;
  const _PieceOperation._() : super._();

  @override

  /// 軸の位置 : X
  /// Axis position : X
  double get axisPositionX;
  @override

  /// 軸の位置 : Y
  /// Axis position : Y
  double get axisPositionY;
  @override

  /// 回転状態種類
  /// Rotation state type
  RotationStateType get rotationStateType;
  @override

  /// 回転角度
  /// Rotation degree
  double get rotationDegree;
  @override

  /// クイックターンフラグ
  /// quick-turn flag
  bool get quickTurnFlag;
  @override

  /// 接地時間
  /// Grounding Time
  double get groundingTime;
  @override
  @JsonKey(ignore: true)
  _$$_PieceOperationCopyWith<_$_PieceOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
