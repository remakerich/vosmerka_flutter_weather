// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

  WeatherFetchEvent fetch(String city) {
    return WeatherFetchEvent(
      city,
    );
  }
}

/// @nodoc
const $WeatherEvent = _$WeatherEventTearOff();

/// @nodoc
mixin _$WeatherEvent {
  String get city => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String city) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String city)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String city)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherFetchEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherFetchEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherFetchEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherEventCopyWith<WeatherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
  $Res call({String city});
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;

  @override
  $Res call({
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $WeatherFetchEventCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory $WeatherFetchEventCopyWith(
          WeatherFetchEvent value, $Res Function(WeatherFetchEvent) then) =
      _$WeatherFetchEventCopyWithImpl<$Res>;
  @override
  $Res call({String city});
}

/// @nodoc
class _$WeatherFetchEventCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $WeatherFetchEventCopyWith<$Res> {
  _$WeatherFetchEventCopyWithImpl(
      WeatherFetchEvent _value, $Res Function(WeatherFetchEvent) _then)
      : super(_value, (v) => _then(v as WeatherFetchEvent));

  @override
  WeatherFetchEvent get _value => super._value as WeatherFetchEvent;

  @override
  $Res call({
    Object? city = freezed,
  }) {
    return _then(WeatherFetchEvent(
      city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherFetchEvent implements WeatherFetchEvent {
  const _$WeatherFetchEvent(this.city);

  @override
  final String city;

  @override
  String toString() {
    return 'WeatherEvent.fetch(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherFetchEvent &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(city));

  @JsonKey(ignore: true)
  @override
  $WeatherFetchEventCopyWith<WeatherFetchEvent> get copyWith =>
      _$WeatherFetchEventCopyWithImpl<WeatherFetchEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String city) fetch,
  }) {
    return fetch(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String city)? fetch,
  }) {
    return fetch?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String city)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherFetchEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherFetchEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherFetchEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class WeatherFetchEvent implements WeatherEvent {
  const factory WeatherFetchEvent(String city) = _$WeatherFetchEvent;

  @override
  String get city;
  @override
  @JsonKey(ignore: true)
  $WeatherFetchEventCopyWith<WeatherFetchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  _WeatherLoading loading(City weather) {
    return _WeatherLoading(
      weather,
    );
  }

  _WeatherReady ready(City weather) {
    return _WeatherReady(
      weather,
    );
  }

  _WeatherError error(City weather) {
    return _WeatherError(
      weather,
    );
  }
}

/// @nodoc
const $WeatherState = _$WeatherStateTearOff();

/// @nodoc
mixin _$WeatherState {
  City get weather => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(City weather) loading,
    required TResult Function(City weather) ready,
    required TResult Function(City weather) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherReady value) ready,
    required TResult Function(_WeatherError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
  $Res call({City weather});
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;

  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc
abstract class _$WeatherLoadingCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherLoadingCopyWith(
          _WeatherLoading value, $Res Function(_WeatherLoading) then) =
      __$WeatherLoadingCopyWithImpl<$Res>;
  @override
  $Res call({City weather});
}

/// @nodoc
class __$WeatherLoadingCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherLoadingCopyWith<$Res> {
  __$WeatherLoadingCopyWithImpl(
      _WeatherLoading _value, $Res Function(_WeatherLoading) _then)
      : super(_value, (v) => _then(v as _WeatherLoading));

  @override
  _WeatherLoading get _value => super._value as _WeatherLoading;

  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_WeatherLoading(
      weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc

class _$_WeatherLoading implements _WeatherLoading {
  const _$_WeatherLoading(this.weather);

  @override
  final City weather;

  @override
  String toString() {
    return 'WeatherState.loading(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherLoading &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  _$WeatherLoadingCopyWith<_WeatherLoading> get copyWith =>
      __$WeatherLoadingCopyWithImpl<_WeatherLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(City weather) loading,
    required TResult Function(City weather) ready,
    required TResult Function(City weather) error,
  }) {
    return loading(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
  }) {
    return loading?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherReady value) ready,
    required TResult Function(_WeatherError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoading implements WeatherState {
  const factory _WeatherLoading(City weather) = _$_WeatherLoading;

  @override
  City get weather;
  @override
  @JsonKey(ignore: true)
  _$WeatherLoadingCopyWith<_WeatherLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WeatherReadyCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherReadyCopyWith(
          _WeatherReady value, $Res Function(_WeatherReady) then) =
      __$WeatherReadyCopyWithImpl<$Res>;
  @override
  $Res call({City weather});
}

/// @nodoc
class __$WeatherReadyCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherReadyCopyWith<$Res> {
  __$WeatherReadyCopyWithImpl(
      _WeatherReady _value, $Res Function(_WeatherReady) _then)
      : super(_value, (v) => _then(v as _WeatherReady));

  @override
  _WeatherReady get _value => super._value as _WeatherReady;

  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_WeatherReady(
      weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc

class _$_WeatherReady implements _WeatherReady {
  const _$_WeatherReady(this.weather);

  @override
  final City weather;

  @override
  String toString() {
    return 'WeatherState.ready(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherReady &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  _$WeatherReadyCopyWith<_WeatherReady> get copyWith =>
      __$WeatherReadyCopyWithImpl<_WeatherReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(City weather) loading,
    required TResult Function(City weather) ready,
    required TResult Function(City weather) error,
  }) {
    return ready(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
  }) {
    return ready?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherReady value) ready,
    required TResult Function(_WeatherError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _WeatherReady implements WeatherState {
  const factory _WeatherReady(City weather) = _$_WeatherReady;

  @override
  City get weather;
  @override
  @JsonKey(ignore: true)
  _$WeatherReadyCopyWith<_WeatherReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WeatherErrorCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherErrorCopyWith(
          _WeatherError value, $Res Function(_WeatherError) then) =
      __$WeatherErrorCopyWithImpl<$Res>;
  @override
  $Res call({City weather});
}

/// @nodoc
class __$WeatherErrorCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherErrorCopyWith<$Res> {
  __$WeatherErrorCopyWithImpl(
      _WeatherError _value, $Res Function(_WeatherError) _then)
      : super(_value, (v) => _then(v as _WeatherError));

  @override
  _WeatherError get _value => super._value as _WeatherError;

  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_WeatherError(
      weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc

class _$_WeatherError implements _WeatherError {
  const _$_WeatherError(this.weather);

  @override
  final City weather;

  @override
  String toString() {
    return 'WeatherState.error(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherError &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  _$WeatherErrorCopyWith<_WeatherError> get copyWith =>
      __$WeatherErrorCopyWithImpl<_WeatherError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(City weather) loading,
    required TResult Function(City weather) ready,
    required TResult Function(City weather) error,
  }) {
    return error(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
  }) {
    return error?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(City weather)? loading,
    TResult Function(City weather)? ready,
    TResult Function(City weather)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeatherLoading value) loading,
    required TResult Function(_WeatherReady value) ready,
    required TResult Function(_WeatherError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeatherLoading value)? loading,
    TResult Function(_WeatherReady value)? ready,
    TResult Function(_WeatherError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _WeatherError implements WeatherState {
  const factory _WeatherError(City weather) = _$_WeatherError;

  @override
  City get weather;
  @override
  @JsonKey(ignore: true)
  _$WeatherErrorCopyWith<_WeatherError> get copyWith =>
      throw _privateConstructorUsedError;
}
