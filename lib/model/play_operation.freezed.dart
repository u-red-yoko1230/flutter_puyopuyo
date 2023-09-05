// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayOperation {
  /// 軸の位置 : X
  /// Axis position : X
  double get axisPositionX => throw _privateConstructorUsedError;

  /// 軸の位置 : Y
  /// Axis position : Y
  double get axisPositionY => throw _privateConstructorUsedError;

  /// 回転状態種類
  /// Rotation state type
  RotationStateType get rotationStateType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayOperationCopyWith<PlayOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayOperationCopyWith<$Res> {
  factory $PlayOperationCopyWith(
          PlayOperation value, $Res Function(PlayOperation) then) =
      _$PlayOperationCopyWithImpl<$Res, PlayOperation>;
  @useResult
  $Res call(
      {double axisPositionX,
      double axisPositionY,
      RotationStateType rotationStateType});
}

/// @nodoc
class _$PlayOperationCopyWithImpl<$Res, $Val extends PlayOperation>
    implements $PlayOperationCopyWith<$Res> {
  _$PlayOperationCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayOperationCopyWith<$Res>
    implements $PlayOperationCopyWith<$Res> {
  factory _$$_PlayOperationCopyWith(
          _$_PlayOperation value, $Res Function(_$_PlayOperation) then) =
      __$$_PlayOperationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double axisPositionX,
      double axisPositionY,
      RotationStateType rotationStateType});
}

/// @nodoc
class __$$_PlayOperationCopyWithImpl<$Res>
    extends _$PlayOperationCopyWithImpl<$Res, _$_PlayOperation>
    implements _$$_PlayOperationCopyWith<$Res> {
  __$$_PlayOperationCopyWithImpl(
      _$_PlayOperation _value, $Res Function(_$_PlayOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? axisPositionX = null,
    Object? axisPositionY = null,
    Object? rotationStateType = null,
  }) {
    return _then(_$_PlayOperation(
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
    ));
  }
}

/// @nodoc

class _$_PlayOperation extends _PlayOperation {
  const _$_PlayOperation(
      {this.axisPositionX = GameSettings.numOfMoveSteps * 2.0,
      this.axisPositionY = GameSettings.numOfMoveSteps * 1.5,
      this.rotationStateType = RotationStateType.U})
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

  @override
  String toString() {
    return 'PlayOperation(axisPositionX: $axisPositionX, axisPositionY: $axisPositionY, rotationStateType: $rotationStateType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayOperation &&
            (identical(other.axisPositionX, axisPositionX) ||
                other.axisPositionX == axisPositionX) &&
            (identical(other.axisPositionY, axisPositionY) ||
                other.axisPositionY == axisPositionY) &&
            (identical(other.rotationStateType, rotationStateType) ||
                other.rotationStateType == rotationStateType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, axisPositionX, axisPositionY, rotationStateType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayOperationCopyWith<_$_PlayOperation> get copyWith =>
      __$$_PlayOperationCopyWithImpl<_$_PlayOperation>(this, _$identity);
}

abstract class _PlayOperation extends PlayOperation {
  const factory _PlayOperation(
      {final double axisPositionX,
      final double axisPositionY,
      final RotationStateType rotationStateType}) = _$_PlayOperation;
  const _PlayOperation._() : super._();

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
  @JsonKey(ignore: true)
  _$$_PlayOperationCopyWith<_$_PlayOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
