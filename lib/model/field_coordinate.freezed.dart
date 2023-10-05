// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FieldCoordinate {
  /// 座標 : X
  int get x => throw _privateConstructorUsedError;

  /// 座標 : Y
  int get y => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int x, int y) $default, {
    required TResult Function(int x, int y, bool isAxis) collisionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int x, int y)? $default, {
    TResult? Function(int x, int y, bool isAxis)? collisionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int x, int y)? $default, {
    TResult Function(int x, int y, bool isAxis)? collisionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FieldCoordinate value) $default, {
    required TResult Function(_FieldCoordinateCollisionCheck value)
        collisionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FieldCoordinate value)? $default, {
    TResult? Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FieldCoordinate value)? $default, {
    TResult Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldCoordinateCopyWith<FieldCoordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCoordinateCopyWith<$Res> {
  factory $FieldCoordinateCopyWith(
          FieldCoordinate value, $Res Function(FieldCoordinate) then) =
      _$FieldCoordinateCopyWithImpl<$Res, FieldCoordinate>;
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class _$FieldCoordinateCopyWithImpl<$Res, $Val extends FieldCoordinate>
    implements $FieldCoordinateCopyWith<$Res> {
  _$FieldCoordinateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldCoordinateCopyWith<$Res>
    implements $FieldCoordinateCopyWith<$Res> {
  factory _$$_FieldCoordinateCopyWith(
          _$_FieldCoordinate value, $Res Function(_$_FieldCoordinate) then) =
      __$$_FieldCoordinateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class __$$_FieldCoordinateCopyWithImpl<$Res>
    extends _$FieldCoordinateCopyWithImpl<$Res, _$_FieldCoordinate>
    implements _$$_FieldCoordinateCopyWith<$Res> {
  __$$_FieldCoordinateCopyWithImpl(
      _$_FieldCoordinate _value, $Res Function(_$_FieldCoordinate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_FieldCoordinate(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FieldCoordinate extends _FieldCoordinate {
  const _$_FieldCoordinate({required this.x, required this.y}) : super._();

  /// 座標 : X
  @override
  final int x;

  /// 座標 : Y
  @override
  final int y;

  @override
  String toString() {
    return 'FieldCoordinate(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldCoordinate &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldCoordinateCopyWith<_$_FieldCoordinate> get copyWith =>
      __$$_FieldCoordinateCopyWithImpl<_$_FieldCoordinate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int x, int y) $default, {
    required TResult Function(int x, int y, bool isAxis) collisionCheck,
  }) {
    return $default(x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int x, int y)? $default, {
    TResult? Function(int x, int y, bool isAxis)? collisionCheck,
  }) {
    return $default?.call(x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int x, int y)? $default, {
    TResult Function(int x, int y, bool isAxis)? collisionCheck,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(x, y);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FieldCoordinate value) $default, {
    required TResult Function(_FieldCoordinateCollisionCheck value)
        collisionCheck,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FieldCoordinate value)? $default, {
    TResult? Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FieldCoordinate value)? $default, {
    TResult Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _FieldCoordinate extends FieldCoordinate {
  const factory _FieldCoordinate({required final int x, required final int y}) =
      _$_FieldCoordinate;
  const _FieldCoordinate._() : super._();

  @override

  /// 座標 : X
  int get x;
  @override

  /// 座標 : Y
  int get y;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCoordinateCopyWith<_$_FieldCoordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FieldCoordinateCollisionCheckCopyWith<$Res>
    implements $FieldCoordinateCopyWith<$Res> {
  factory _$$_FieldCoordinateCollisionCheckCopyWith(
          _$_FieldCoordinateCollisionCheck value,
          $Res Function(_$_FieldCoordinateCollisionCheck) then) =
      __$$_FieldCoordinateCollisionCheckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y, bool isAxis});
}

/// @nodoc
class __$$_FieldCoordinateCollisionCheckCopyWithImpl<$Res>
    extends _$FieldCoordinateCopyWithImpl<$Res,
        _$_FieldCoordinateCollisionCheck>
    implements _$$_FieldCoordinateCollisionCheckCopyWith<$Res> {
  __$$_FieldCoordinateCollisionCheckCopyWithImpl(
      _$_FieldCoordinateCollisionCheck _value,
      $Res Function(_$_FieldCoordinateCollisionCheck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? isAxis = null,
  }) {
    return _then(_$_FieldCoordinateCollisionCheck(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      isAxis: null == isAxis
          ? _value.isAxis
          : isAxis // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FieldCoordinateCollisionCheck extends _FieldCoordinateCollisionCheck {
  const _$_FieldCoordinateCollisionCheck(
      {required this.x, required this.y, this.isAxis = false})
      : super._();

  /// 座標 : X
  @override
  final int x;

  /// 座標 : Y
  @override
  final int y;

  /// 軸である
  @override
  @JsonKey()
  final bool isAxis;

  @override
  String toString() {
    return 'FieldCoordinate.collisionCheck(x: $x, y: $y, isAxis: $isAxis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldCoordinateCollisionCheck &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.isAxis, isAxis) || other.isAxis == isAxis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, isAxis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldCoordinateCollisionCheckCopyWith<_$_FieldCoordinateCollisionCheck>
      get copyWith => __$$_FieldCoordinateCollisionCheckCopyWithImpl<
          _$_FieldCoordinateCollisionCheck>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int x, int y) $default, {
    required TResult Function(int x, int y, bool isAxis) collisionCheck,
  }) {
    return collisionCheck(x, y, isAxis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int x, int y)? $default, {
    TResult? Function(int x, int y, bool isAxis)? collisionCheck,
  }) {
    return collisionCheck?.call(x, y, isAxis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int x, int y)? $default, {
    TResult Function(int x, int y, bool isAxis)? collisionCheck,
    required TResult orElse(),
  }) {
    if (collisionCheck != null) {
      return collisionCheck(x, y, isAxis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FieldCoordinate value) $default, {
    required TResult Function(_FieldCoordinateCollisionCheck value)
        collisionCheck,
  }) {
    return collisionCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FieldCoordinate value)? $default, {
    TResult? Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
  }) {
    return collisionCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FieldCoordinate value)? $default, {
    TResult Function(_FieldCoordinateCollisionCheck value)? collisionCheck,
    required TResult orElse(),
  }) {
    if (collisionCheck != null) {
      return collisionCheck(this);
    }
    return orElse();
  }
}

abstract class _FieldCoordinateCollisionCheck extends FieldCoordinate {
  const factory _FieldCoordinateCollisionCheck(
      {required final int x,
      required final int y,
      final bool isAxis}) = _$_FieldCoordinateCollisionCheck;
  const _FieldCoordinateCollisionCheck._() : super._();

  @override

  /// 座標 : X
  int get x;
  @override

  /// 座標 : Y
  int get y;

  /// 軸である
  bool get isAxis;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCoordinateCollisionCheckCopyWith<_$_FieldCoordinateCollisionCheck>
      get copyWith => throw _privateConstructorUsedError;
}
