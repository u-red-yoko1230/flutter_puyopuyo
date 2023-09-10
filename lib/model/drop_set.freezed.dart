// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DropSet {
  /// ぷよ形種類
  /// Puyo shape Type
  PuyoShapeType get puyoShapeType => throw _privateConstructorUsedError;

  /// ぷよ種類 : 軸
  /// Puyo shape Type
  PuyoType get puyoTypeAxis => throw _privateConstructorUsedError;

  /// ぷよ種類 : 子
  /// Puyo shape Type
  PuyoType get puyoTypeChild => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DropSetCopyWith<DropSet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropSetCopyWith<$Res> {
  factory $DropSetCopyWith(DropSet value, $Res Function(DropSet) then) =
      _$DropSetCopyWithImpl<$Res, DropSet>;
  @useResult
  $Res call(
      {PuyoShapeType puyoShapeType,
      PuyoType puyoTypeAxis,
      PuyoType puyoTypeChild});
}

/// @nodoc
class _$DropSetCopyWithImpl<$Res, $Val extends DropSet>
    implements $DropSetCopyWith<$Res> {
  _$DropSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puyoShapeType = null,
    Object? puyoTypeAxis = null,
    Object? puyoTypeChild = null,
  }) {
    return _then(_value.copyWith(
      puyoShapeType: null == puyoShapeType
          ? _value.puyoShapeType
          : puyoShapeType // ignore: cast_nullable_to_non_nullable
              as PuyoShapeType,
      puyoTypeAxis: null == puyoTypeAxis
          ? _value.puyoTypeAxis
          : puyoTypeAxis // ignore: cast_nullable_to_non_nullable
              as PuyoType,
      puyoTypeChild: null == puyoTypeChild
          ? _value.puyoTypeChild
          : puyoTypeChild // ignore: cast_nullable_to_non_nullable
              as PuyoType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DropSetCopyWith<$Res> implements $DropSetCopyWith<$Res> {
  factory _$$_DropSetCopyWith(
          _$_DropSet value, $Res Function(_$_DropSet) then) =
      __$$_DropSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PuyoShapeType puyoShapeType,
      PuyoType puyoTypeAxis,
      PuyoType puyoTypeChild});
}

/// @nodoc
class __$$_DropSetCopyWithImpl<$Res>
    extends _$DropSetCopyWithImpl<$Res, _$_DropSet>
    implements _$$_DropSetCopyWith<$Res> {
  __$$_DropSetCopyWithImpl(_$_DropSet _value, $Res Function(_$_DropSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puyoShapeType = null,
    Object? puyoTypeAxis = null,
    Object? puyoTypeChild = null,
  }) {
    return _then(_$_DropSet(
      puyoShapeType: null == puyoShapeType
          ? _value.puyoShapeType
          : puyoShapeType // ignore: cast_nullable_to_non_nullable
              as PuyoShapeType,
      puyoTypeAxis: null == puyoTypeAxis
          ? _value.puyoTypeAxis
          : puyoTypeAxis // ignore: cast_nullable_to_non_nullable
              as PuyoType,
      puyoTypeChild: null == puyoTypeChild
          ? _value.puyoTypeChild
          : puyoTypeChild // ignore: cast_nullable_to_non_nullable
              as PuyoType,
    ));
  }
}

/// @nodoc

class _$_DropSet extends _DropSet {
  const _$_DropSet(
      {this.puyoShapeType = PuyoShapeType.I,
      this.puyoTypeAxis = PuyoType.n,
      this.puyoTypeChild = PuyoType.n})
      : super._();

  /// ぷよ形種類
  /// Puyo shape Type
  @override
  @JsonKey()
  final PuyoShapeType puyoShapeType;

  /// ぷよ種類 : 軸
  /// Puyo shape Type
  @override
  @JsonKey()
  final PuyoType puyoTypeAxis;

  /// ぷよ種類 : 子
  /// Puyo shape Type
  @override
  @JsonKey()
  final PuyoType puyoTypeChild;

  @override
  String toString() {
    return 'DropSet(puyoShapeType: $puyoShapeType, puyoTypeAxis: $puyoTypeAxis, puyoTypeChild: $puyoTypeChild)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DropSet &&
            (identical(other.puyoShapeType, puyoShapeType) ||
                other.puyoShapeType == puyoShapeType) &&
            (identical(other.puyoTypeAxis, puyoTypeAxis) ||
                other.puyoTypeAxis == puyoTypeAxis) &&
            (identical(other.puyoTypeChild, puyoTypeChild) ||
                other.puyoTypeChild == puyoTypeChild));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, puyoShapeType, puyoTypeAxis, puyoTypeChild);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DropSetCopyWith<_$_DropSet> get copyWith =>
      __$$_DropSetCopyWithImpl<_$_DropSet>(this, _$identity);
}

abstract class _DropSet extends DropSet {
  const factory _DropSet(
      {final PuyoShapeType puyoShapeType,
      final PuyoType puyoTypeAxis,
      final PuyoType puyoTypeChild}) = _$_DropSet;
  const _DropSet._() : super._();

  @override

  /// ぷよ形種類
  /// Puyo shape Type
  PuyoShapeType get puyoShapeType;
  @override

  /// ぷよ種類 : 軸
  /// Puyo shape Type
  PuyoType get puyoTypeAxis;
  @override

  /// ぷよ種類 : 子
  /// Puyo shape Type
  PuyoType get puyoTypeChild;
  @override
  @JsonKey(ignore: true)
  _$$_DropSetCopyWith<_$_DropSet> get copyWith =>
      throw _privateConstructorUsedError;
}
