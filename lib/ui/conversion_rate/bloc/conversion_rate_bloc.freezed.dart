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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) updateValue,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateValue value) updateValue,
    required TResult Function(ResetValue value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRateEventCopyWith<$Res> {
  factory $ConversionRateEventCopyWith(
          ConversionRateEvent value, $Res Function(ConversionRateEvent) then) =
      _$ConversionRateEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversionRateEventCopyWithImpl<$Res>
    implements $ConversionRateEventCopyWith<$Res> {
  _$ConversionRateEventCopyWithImpl(this._value, this._then);

  final ConversionRateEvent _value;
  // ignore: unused_field
  final $Res Function(ConversionRateEvent) _then;
}

/// @nodoc
abstract class _$$UpdateValueCopyWith<$Res> {
  factory _$$UpdateValueCopyWith(
          _$UpdateValue value, $Res Function(_$UpdateValue) then) =
      __$$UpdateValueCopyWithImpl<$Res>;
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
    required TResult Function() reset,
  }) {
    return updateValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
  }) {
    return updateValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
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
    required TResult Function(ResetValue value) reset,
  }) {
    return updateValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
  }) {
    return updateValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
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

  double get value;
  @JsonKey(ignore: true)
  _$$UpdateValueCopyWith<_$UpdateValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetValueCopyWith<$Res> {
  factory _$$ResetValueCopyWith(
          _$ResetValue value, $Res Function(_$ResetValue) then) =
      __$$ResetValueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetValueCopyWithImpl<$Res>
    extends _$ConversionRateEventCopyWithImpl<$Res>
    implements _$$ResetValueCopyWith<$Res> {
  __$$ResetValueCopyWithImpl(
      _$ResetValue _value, $Res Function(_$ResetValue) _then)
      : super(_value, (v) => _then(v as _$ResetValue));

  @override
  _$ResetValue get _value => super._value as _$ResetValue;
}

/// @nodoc

class _$ResetValue implements ResetValue {
  const _$ResetValue();

  @override
  String toString() {
    return 'ConversionRateEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double value) updateValue,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double value)? updateValue,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateValue value) updateValue,
    required TResult Function(ResetValue value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateValue value)? updateValue,
    TResult Function(ResetValue value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class ResetValue implements ConversionRateEvent {
  const factory ResetValue() = _$ResetValue;
}

/// @nodoc
mixin _$ConversionRateState {
  double get conversionRate => throw _privateConstructorUsedError;
  double get defaultConversionRate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversionRateStateCopyWith<ConversionRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRateStateCopyWith<$Res> {
  factory $ConversionRateStateCopyWith(
          ConversionRateState value, $Res Function(ConversionRateState) then) =
      _$ConversionRateStateCopyWithImpl<$Res>;
  $Res call({double conversionRate, double defaultConversionRate});
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
    Object? defaultConversionRate = freezed,
  }) {
    return _then(_value.copyWith(
      conversionRate: conversionRate == freezed
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      defaultConversionRate: defaultConversionRate == freezed
          ? _value.defaultConversionRate
          : defaultConversionRate // ignore: cast_nullable_to_non_nullable
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
  $Res call({double conversionRate, double defaultConversionRate});
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
    Object? defaultConversionRate = freezed,
  }) {
    return _then(_$_ConversionRateState(
      conversionRate: conversionRate == freezed
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      defaultConversionRate: defaultConversionRate == freezed
          ? _value.defaultConversionRate
          : defaultConversionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ConversionRateState extends _ConversionRateState {
  const _$_ConversionRateState(
      {required this.conversionRate, required this.defaultConversionRate})
      : super._();

  @override
  final double conversionRate;
  @override
  final double defaultConversionRate;

  @override
  String toString() {
    return 'ConversionRateState(conversionRate: $conversionRate, defaultConversionRate: $defaultConversionRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversionRateState &&
            const DeepCollectionEquality()
                .equals(other.conversionRate, conversionRate) &&
            const DeepCollectionEquality()
                .equals(other.defaultConversionRate, defaultConversionRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversionRate),
      const DeepCollectionEquality().hash(defaultConversionRate));

  @JsonKey(ignore: true)
  @override
  _$$_ConversionRateStateCopyWith<_$_ConversionRateState> get copyWith =>
      __$$_ConversionRateStateCopyWithImpl<_$_ConversionRateState>(
          this, _$identity);
}

abstract class _ConversionRateState extends ConversionRateState {
  const factory _ConversionRateState(
      {required final double conversionRate,
      required final double defaultConversionRate}) = _$_ConversionRateState;
  const _ConversionRateState._() : super._();

  @override
  double get conversionRate;
  @override
  double get defaultConversionRate;
  @override
  @JsonKey(ignore: true)
  _$$_ConversionRateStateCopyWith<_$_ConversionRateState> get copyWith =>
      throw _privateConstructorUsedError;
}
