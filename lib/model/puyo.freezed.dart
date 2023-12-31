// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puyo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Puyo {
  /// ぷよ種類
  PuyoType get puyoType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PuyoType puyoType) $default, {
    required TResult Function(
            PuyoType puyoType,
            bool justDropped,
            bool connectedTop,
            bool connectedRight,
            bool connectedBottom,
            bool connectedLeft)
        field,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PuyoType puyoType)? $default, {
    TResult? Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PuyoType puyoType)? $default, {
    TResult Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Puyo value) $default, {
    required TResult Function(PuyoField value) field,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Puyo value)? $default, {
    TResult? Function(PuyoField value)? field,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Puyo value)? $default, {
    TResult Function(PuyoField value)? field,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PuyoCopyWith<Puyo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuyoCopyWith<$Res> {
  factory $PuyoCopyWith(Puyo value, $Res Function(Puyo) then) =
      _$PuyoCopyWithImpl<$Res, Puyo>;
  @useResult
  $Res call({PuyoType puyoType});
}

/// @nodoc
class _$PuyoCopyWithImpl<$Res, $Val extends Puyo>
    implements $PuyoCopyWith<$Res> {
  _$PuyoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puyoType = null,
  }) {
    return _then(_value.copyWith(
      puyoType: null == puyoType
          ? _value.puyoType
          : puyoType // ignore: cast_nullable_to_non_nullable
              as PuyoType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PuyoCopyWith<$Res> implements $PuyoCopyWith<$Res> {
  factory _$$_PuyoCopyWith(_$_Puyo value, $Res Function(_$_Puyo) then) =
      __$$_PuyoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PuyoType puyoType});
}

/// @nodoc
class __$$_PuyoCopyWithImpl<$Res> extends _$PuyoCopyWithImpl<$Res, _$_Puyo>
    implements _$$_PuyoCopyWith<$Res> {
  __$$_PuyoCopyWithImpl(_$_Puyo _value, $Res Function(_$_Puyo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puyoType = null,
  }) {
    return _then(_$_Puyo(
      puyoType: null == puyoType
          ? _value.puyoType
          : puyoType // ignore: cast_nullable_to_non_nullable
              as PuyoType,
    ));
  }
}

/// @nodoc

class _$_Puyo extends _Puyo {
  const _$_Puyo({this.puyoType = PuyoType.n}) : super._();

  /// ぷよ種類
  @override
  @JsonKey()
  final PuyoType puyoType;

  @override
  String toString() {
    return 'Puyo(puyoType: $puyoType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Puyo &&
            (identical(other.puyoType, puyoType) ||
                other.puyoType == puyoType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, puyoType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PuyoCopyWith<_$_Puyo> get copyWith =>
      __$$_PuyoCopyWithImpl<_$_Puyo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PuyoType puyoType) $default, {
    required TResult Function(
            PuyoType puyoType,
            bool justDropped,
            bool connectedTop,
            bool connectedRight,
            bool connectedBottom,
            bool connectedLeft)
        field,
  }) {
    return $default(puyoType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PuyoType puyoType)? $default, {
    TResult? Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
  }) {
    return $default?.call(puyoType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PuyoType puyoType)? $default, {
    TResult Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(puyoType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Puyo value) $default, {
    required TResult Function(PuyoField value) field,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Puyo value)? $default, {
    TResult? Function(PuyoField value)? field,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Puyo value)? $default, {
    TResult Function(PuyoField value)? field,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Puyo extends Puyo {
  const factory _Puyo({final PuyoType puyoType}) = _$_Puyo;
  const _Puyo._() : super._();

  @override

  /// ぷよ種類
  PuyoType get puyoType;
  @override
  @JsonKey(ignore: true)
  _$$_PuyoCopyWith<_$_Puyo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PuyoFieldCopyWith<$Res> implements $PuyoCopyWith<$Res> {
  factory _$$PuyoFieldCopyWith(
          _$PuyoField value, $Res Function(_$PuyoField) then) =
      __$$PuyoFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PuyoType puyoType,
      bool justDropped,
      bool connectedTop,
      bool connectedRight,
      bool connectedBottom,
      bool connectedLeft});
}

/// @nodoc
class __$$PuyoFieldCopyWithImpl<$Res>
    extends _$PuyoCopyWithImpl<$Res, _$PuyoField>
    implements _$$PuyoFieldCopyWith<$Res> {
  __$$PuyoFieldCopyWithImpl(
      _$PuyoField _value, $Res Function(_$PuyoField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puyoType = null,
    Object? justDropped = null,
    Object? connectedTop = null,
    Object? connectedRight = null,
    Object? connectedBottom = null,
    Object? connectedLeft = null,
  }) {
    return _then(_$PuyoField(
      puyoType: null == puyoType
          ? _value.puyoType
          : puyoType // ignore: cast_nullable_to_non_nullable
              as PuyoType,
      justDropped: null == justDropped
          ? _value.justDropped
          : justDropped // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedTop: null == connectedTop
          ? _value.connectedTop
          : connectedTop // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedRight: null == connectedRight
          ? _value.connectedRight
          : connectedRight // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedBottom: null == connectedBottom
          ? _value.connectedBottom
          : connectedBottom // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedLeft: null == connectedLeft
          ? _value.connectedLeft
          : connectedLeft // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PuyoField extends PuyoField {
  const _$PuyoField(
      {this.puyoType = PuyoType.n,
      this.justDropped = false,
      this.connectedTop = false,
      this.connectedRight = false,
      this.connectedBottom = false,
      this.connectedLeft = false})
      : super._();

  /// ぷよ種類
  @override
  @JsonKey()
  final PuyoType puyoType;

  /// 落下したばかり
  @override
  @JsonKey()
  final bool justDropped;

  /// 連結 : 上
  @override
  @JsonKey()
  final bool connectedTop;

  /// 連結 : 右
  @override
  @JsonKey()
  final bool connectedRight;

  /// 連結 : 右
  @override
  @JsonKey()
  final bool connectedBottom;

  /// 連結 : 左
  @override
  @JsonKey()
  final bool connectedLeft;

  @override
  String toString() {
    return 'Puyo.field(puyoType: $puyoType, justDropped: $justDropped, connectedTop: $connectedTop, connectedRight: $connectedRight, connectedBottom: $connectedBottom, connectedLeft: $connectedLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuyoField &&
            (identical(other.puyoType, puyoType) ||
                other.puyoType == puyoType) &&
            (identical(other.justDropped, justDropped) ||
                other.justDropped == justDropped) &&
            (identical(other.connectedTop, connectedTop) ||
                other.connectedTop == connectedTop) &&
            (identical(other.connectedRight, connectedRight) ||
                other.connectedRight == connectedRight) &&
            (identical(other.connectedBottom, connectedBottom) ||
                other.connectedBottom == connectedBottom) &&
            (identical(other.connectedLeft, connectedLeft) ||
                other.connectedLeft == connectedLeft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, puyoType, justDropped,
      connectedTop, connectedRight, connectedBottom, connectedLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PuyoFieldCopyWith<_$PuyoField> get copyWith =>
      __$$PuyoFieldCopyWithImpl<_$PuyoField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PuyoType puyoType) $default, {
    required TResult Function(
            PuyoType puyoType,
            bool justDropped,
            bool connectedTop,
            bool connectedRight,
            bool connectedBottom,
            bool connectedLeft)
        field,
  }) {
    return field(puyoType, justDropped, connectedTop, connectedRight,
        connectedBottom, connectedLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PuyoType puyoType)? $default, {
    TResult? Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
  }) {
    return field?.call(puyoType, justDropped, connectedTop, connectedRight,
        connectedBottom, connectedLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PuyoType puyoType)? $default, {
    TResult Function(PuyoType puyoType, bool justDropped, bool connectedTop,
            bool connectedRight, bool connectedBottom, bool connectedLeft)?
        field,
    required TResult orElse(),
  }) {
    if (field != null) {
      return field(puyoType, justDropped, connectedTop, connectedRight,
          connectedBottom, connectedLeft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Puyo value) $default, {
    required TResult Function(PuyoField value) field,
  }) {
    return field(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Puyo value)? $default, {
    TResult? Function(PuyoField value)? field,
  }) {
    return field?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Puyo value)? $default, {
    TResult Function(PuyoField value)? field,
    required TResult orElse(),
  }) {
    if (field != null) {
      return field(this);
    }
    return orElse();
  }
}

abstract class PuyoField extends Puyo {
  const factory PuyoField(
      {final PuyoType puyoType,
      final bool justDropped,
      final bool connectedTop,
      final bool connectedRight,
      final bool connectedBottom,
      final bool connectedLeft}) = _$PuyoField;
  const PuyoField._() : super._();

  @override

  /// ぷよ種類
  PuyoType get puyoType;

  /// 落下したばかり
  bool get justDropped;

  /// 連結 : 上
  bool get connectedTop;

  /// 連結 : 右
  bool get connectedRight;

  /// 連結 : 右
  bool get connectedBottom;

  /// 連結 : 左
  bool get connectedLeft;
  @override
  @JsonKey(ignore: true)
  _$$PuyoFieldCopyWith<_$PuyoField> get copyWith =>
      throw _privateConstructorUsedError;
}
