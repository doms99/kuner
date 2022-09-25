// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversion_screen_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversionScreenViewState {
  ConversionDirection get direction => throw _privateConstructorUsedError;
  double get inputValue => throw _privateConstructorUsedError;
  double get convertedValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversionScreenViewStateCopyWith<ConversionScreenViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionScreenViewStateCopyWith<$Res> {
  factory $ConversionScreenViewStateCopyWith(ConversionScreenViewState value,
          $Res Function(ConversionScreenViewState) then) =
      _$ConversionScreenViewStateCopyWithImpl<$Res>;
  $Res call(
      {ConversionDirection direction,
      double inputValue,
      double convertedValue});
}

/// @nodoc
class _$ConversionScreenViewStateCopyWithImpl<$Res>
    implements $ConversionScreenViewStateCopyWith<$Res> {
  _$ConversionScreenViewStateCopyWithImpl(this._value, this._then);

  final ConversionScreenViewState _value;
  // ignore: unused_field
  final $Res Function(ConversionScreenViewState) _then;

  @override
  $Res call({
    Object? direction = freezed,
    Object? inputValue = freezed,
    Object? convertedValue = freezed,
  }) {
    return _then(_value.copyWith(
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ConversionDirection,
      inputValue: inputValue == freezed
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValue: convertedValue == freezed
          ? _value.convertedValue
          : convertedValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ConversionScreenViewStateCopyWith<$Res>
    implements $ConversionScreenViewStateCopyWith<$Res> {
  factory _$$_ConversionScreenViewStateCopyWith(
          _$_ConversionScreenViewState value,
          $Res Function(_$_ConversionScreenViewState) then) =
      __$$_ConversionScreenViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ConversionDirection direction,
      double inputValue,
      double convertedValue});
}

/// @nodoc
class __$$_ConversionScreenViewStateCopyWithImpl<$Res>
    extends _$ConversionScreenViewStateCopyWithImpl<$Res>
    implements _$$_ConversionScreenViewStateCopyWith<$Res> {
  __$$_ConversionScreenViewStateCopyWithImpl(
      _$_ConversionScreenViewState _value,
      $Res Function(_$_ConversionScreenViewState) _then)
      : super(_value, (v) => _then(v as _$_ConversionScreenViewState));

  @override
  _$_ConversionScreenViewState get _value =>
      super._value as _$_ConversionScreenViewState;

  @override
  $Res call({
    Object? direction = freezed,
    Object? inputValue = freezed,
    Object? convertedValue = freezed,
  }) {
    return _then(_$_ConversionScreenViewState(
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ConversionDirection,
      inputValue: inputValue == freezed
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double,
      convertedValue: convertedValue == freezed
          ? _value.convertedValue
          : convertedValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ConversionScreenViewState extends _ConversionScreenViewState {
  const _$_ConversionScreenViewState(
      {required this.direction,
      required this.inputValue,
      required this.convertedValue})
      : super._();

  @override
  final ConversionDirection direction;
  @override
  final double inputValue;
  @override
  final double convertedValue;

  @override
  String toString() {
    return 'ConversionScreenViewState(direction: $direction, inputValue: $inputValue, convertedValue: $convertedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversionScreenViewState &&
            const DeepCollectionEquality().equals(other.direction, direction) &&
            const DeepCollectionEquality()
                .equals(other.inputValue, inputValue) &&
            const DeepCollectionEquality()
                .equals(other.convertedValue, convertedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(direction),
      const DeepCollectionEquality().hash(inputValue),
      const DeepCollectionEquality().hash(convertedValue));

  @JsonKey(ignore: true)
  @override
  _$$_ConversionScreenViewStateCopyWith<_$_ConversionScreenViewState>
      get copyWith => __$$_ConversionScreenViewStateCopyWithImpl<
          _$_ConversionScreenViewState>(this, _$identity);
}

abstract class _ConversionScreenViewState extends ConversionScreenViewState {
  const factory _ConversionScreenViewState(
      {required final ConversionDirection direction,
      required final double inputValue,
      required final double convertedValue}) = _$_ConversionScreenViewState;
  const _ConversionScreenViewState._() : super._();

  @override
  ConversionDirection get direction;
  @override
  double get inputValue;
  @override
  double get convertedValue;
  @override
  @JsonKey(ignore: true)
  _$$_ConversionScreenViewStateCopyWith<_$_ConversionScreenViewState>
      get copyWith => throw _privateConstructorUsedError;
}