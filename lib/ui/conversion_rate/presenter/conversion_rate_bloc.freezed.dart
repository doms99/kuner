// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversion_rate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversionRateEvent {
  double get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) updateValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double value)? updateValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateValue value) updateValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversionRateEventCopyWith<ConversionRateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRateEventCopyWith<$Res> {
  factory $ConversionRateEventCopyWith(
          ConversionRateEvent value, $Res Function(ConversionRateEvent) then) =
      _$ConversionRateEventCopyWithImpl<$Res>;
  $Res call({double value});
}

/// @nodoc
class _$ConversionRateEventCopyWithImpl<$Res>
    implements $ConversionRateEventCopyWith<$Res> {
  _$ConversionRateEventCopyWithImpl(this._value, this._then);

  final ConversionRateEvent _value;
  // ignore: unused_field
  final $Res Function(ConversionRateEvent) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$UpdateValueCopyWith<$Res>
    implements $ConversionRateEventCopyWith<$Res> {
  factory _$$UpdateValueCopyWith(
          _$UpdateValue value, $Res Function(_$UpdateValue) then) =
      __$$UpdateValueCopyWithImpl<$Res>;
  @override
  $Res call({double value});
}

/// @nodoc
class __$$UpdateValueCopyWithImpl<$Res>
    extends _$ConversionRateEventCopyWithImpl<$Res>
    implements _$$UpdateValueCopyWith<$Res> {
  __$$UpdateValueCopyWithImpl(
      _$UpdateValue _value, $Res Function(_$UpdateValue) _then)
      : super(_value, (v) => _then(v as _$UpdateValue));

  @override
  _$UpdateValue get _value => super._value as _$UpdateValue;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$UpdateValue(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateValue implements UpdateValue {
  const _$UpdateValue(this.value);

  @override
  final double value;

  @override
  String toString() {
    return 'ConversionRateEvent.updateValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateValue &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$UpdateValueCopyWith<_$UpdateValue> get copyWith =>
      __$$UpdateValueCopyWithImpl<_$UpdateValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) updateValue,
  }) {
    return updateValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double value)? updateValue,
  }) {
    return updateValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    required TResult orElse(),
  }) {
    if (updateValue != null) {
      return updateValue(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateValue value) updateValue,
  }) {
    return updateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
  }) {
    return updateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    required TResult orElse(),
  }) {
    if (updateValue != null) {
      return updateValue(this);
    }
    return orElse();
  }
}

abstract class UpdateValue implements ConversionRateEvent {
  const factory UpdateValue(final double value) = _$UpdateValue;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$UpdateValueCopyWith<_$UpdateValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConversionRateState {
  double get conversionRate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversionRateStateCopyWith<ConversionRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRateStateCopyWith<$Res> {
  factory $ConversionRateStateCopyWith(
          ConversionRateState value, $Res Function(ConversionRateState) then) =
      _$ConversionRateStateCopyWithImpl<$Res>;
  $Res call({double conversionRate});
}

/// @nodoc
class _$ConversionRateStateCopyWithImpl<$Res>
    implements $ConversionRateStateCopyWith<$Res> {
  _$ConversionRateStateCopyWithImpl(this._value, this._then);

  final ConversionRateState _value;
  // ignore: unused_field
  final $Res Function(ConversionRateState) _then;

  @override
  $Res call({
    Object? conversionRate = freezed,
  }) {
    return _then(_value.copyWith(
      conversionRate: conversionRate == freezed
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ConversionRateStateCopyWith<$Res>
    implements $ConversionRateStateCopyWith<$Res> {
  factory _$$_ConversionRateStateCopyWith(_$_ConversionRateState value,
          $Res Function(_$_ConversionRateState) then) =
      __$$_ConversionRateStateCopyWithImpl<$Res>;
  @override
  $Res call({double conversionRate});
}

/// @nodoc
class __$$_ConversionRateStateCopyWithImpl<$Res>
    extends _$ConversionRateStateCopyWithImpl<$Res>
    implements _$$_ConversionRateStateCopyWith<$Res> {
  __$$_ConversionRateStateCopyWithImpl(_$_ConversionRateState _value,
      $Res Function(_$_ConversionRateState) _then)
      : super(_value, (v) => _then(v as _$_ConversionRateState));

  @override
  _$_ConversionRateState get _value => super._value as _$_ConversionRateState;

  @override
  $Res call({
    Object? conversionRate = freezed,
  }) {
    return _then(_$_ConversionRateState(
      conversionRate: conversionRate == freezed
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ConversionRateState implements _ConversionRateState {
  const _$_ConversionRateState({required this.conversionRate});

  @override
  final double conversionRate;

  @override
  String toString() {
    return 'ConversionRateState(conversionRate: $conversionRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversionRateState &&
            const DeepCollectionEquality()
                .equals(other.conversionRate, conversionRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversionRate));

  @JsonKey(ignore: true)
  @override
  _$$_ConversionRateStateCopyWith<_$_ConversionRateState> get copyWith =>
      __$$_ConversionRateStateCopyWithImpl<_$_ConversionRateState>(
          this, _$identity);
}

abstract class _ConversionRateState implements ConversionRateState {
  const factory _ConversionRateState({required final double conversionRate}) =
      _$_ConversionRateState;

  @override
  double get conversionRate;
  @override
  @JsonKey(ignore: true)
  _$$_ConversionRateStateCopyWith<_$_ConversionRateState> get copyWith =>
      throw _privateConstructorUsedError;
}
