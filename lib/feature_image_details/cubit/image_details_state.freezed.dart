// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageDetailsState {
  bool get isFavorite => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isFavorite) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isFavorite)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isFavorite)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageDetailsStateFavorite value) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageDetailsStateFavorite value)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageDetailsStateFavorite value)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageDetailsStateCopyWith<ImageDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDetailsStateCopyWith<$Res> {
  factory $ImageDetailsStateCopyWith(
          ImageDetailsState value, $Res Function(ImageDetailsState) then) =
      _$ImageDetailsStateCopyWithImpl<$Res, ImageDetailsState>;
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class _$ImageDetailsStateCopyWithImpl<$Res, $Val extends ImageDetailsState>
    implements $ImageDetailsStateCopyWith<$Res> {
  _$ImageDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDetailsStateFavoriteImplCopyWith<$Res>
    implements $ImageDetailsStateCopyWith<$Res> {
  factory _$$ImageDetailsStateFavoriteImplCopyWith(
          _$ImageDetailsStateFavoriteImpl value,
          $Res Function(_$ImageDetailsStateFavoriteImpl) then) =
      __$$ImageDetailsStateFavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class __$$ImageDetailsStateFavoriteImplCopyWithImpl<$Res>
    extends _$ImageDetailsStateCopyWithImpl<$Res,
        _$ImageDetailsStateFavoriteImpl>
    implements _$$ImageDetailsStateFavoriteImplCopyWith<$Res> {
  __$$ImageDetailsStateFavoriteImplCopyWithImpl(
      _$ImageDetailsStateFavoriteImpl _value,
      $Res Function(_$ImageDetailsStateFavoriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
  }) {
    return _then(_$ImageDetailsStateFavoriteImpl(
      null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ImageDetailsStateFavoriteImpl implements ImageDetailsStateFavorite {
  const _$ImageDetailsStateFavoriteImpl(this.isFavorite);

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'ImageDetailsState.favorite(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDetailsStateFavoriteImpl &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDetailsStateFavoriteImplCopyWith<_$ImageDetailsStateFavoriteImpl>
      get copyWith => __$$ImageDetailsStateFavoriteImplCopyWithImpl<
          _$ImageDetailsStateFavoriteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isFavorite) favorite,
  }) {
    return favorite(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isFavorite)? favorite,
  }) {
    return favorite?.call(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isFavorite)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageDetailsStateFavorite value) favorite,
  }) {
    return favorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageDetailsStateFavorite value)? favorite,
  }) {
    return favorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageDetailsStateFavorite value)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(this);
    }
    return orElse();
  }
}

abstract class ImageDetailsStateFavorite implements ImageDetailsState {
  const factory ImageDetailsStateFavorite(final bool isFavorite) =
      _$ImageDetailsStateFavoriteImpl;

  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$ImageDetailsStateFavoriteImplCopyWith<_$ImageDetailsStateFavoriteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
