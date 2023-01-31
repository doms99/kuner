// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_screen_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsScreenViewState {
  bool get showDecimal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsScreenViewStateCopyWith<SettingsScreenViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsScreenViewStateCopyWith<$Res> {
  factory $SettingsScreenViewStateCopyWith(SettingsScreenViewState value,
          $Res Function(SettingsScreenViewState) then) =
      _$SettingsScreenViewStateCopyWithImpl<$Res>;
  $Res call({bool showDecimal});
}

/// @nodoc
class _$SettingsScreenViewStateCopyWithImpl<$Res>
    implements $SettingsScreenViewStateCopyWith<$Res> {
  _$SettingsScreenViewStateCopyWithImpl(this._value, this._then);

  final SettingsScreenViewState _value;
  // ignore: unused_field
  final $Res Function(SettingsScreenViewState) _then;

  @override
  $Res call({
    Object? showDecimal = freezed,
  }) {
    return _then(_value.copyWith(
      showDecimal: showDecimal == freezed
          ? _value.showDecimal
          : showDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsScreenViewStateCopyWith<$Res>
    implements $SettingsScreenViewStateCopyWith<$Res> {
  factory _$$_SettingsScreenViewStateCopyWith(_$_SettingsScreenViewState value,
          $Res Function(_$_SettingsScreenViewState) then) =
      __$$_SettingsScreenViewStateCopyWithImpl<$Res>;
  @override
  $Res call({bool showDecimal});
}

/// @nodoc
class __$$_SettingsScreenViewStateCopyWithImpl<$Res>
    extends _$SettingsScreenViewStateCopyWithImpl<$Res>
    implements _$$_SettingsScreenViewStateCopyWith<$Res> {
  __$$_SettingsScreenViewStateCopyWithImpl(_$_SettingsScreenViewState _value,
      $Res Function(_$_SettingsScreenViewState) _then)
      : super(_value, (v) => _then(v as _$_SettingsScreenViewState));

  @override
  _$_SettingsScreenViewState get _value =>
      super._value as _$_SettingsScreenViewState;

  @override
  $Res call({
    Object? showDecimal = freezed,
  }) {
    return _then(_$_SettingsScreenViewState(
      showDecimal: showDecimal == freezed
          ? _value.showDecimal
          : showDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingsScreenViewState extends _SettingsScreenViewState {
  const _$_SettingsScreenViewState({required this.showDecimal}) : super._();

  @override
  final bool showDecimal;

  @override
  String toString() {
    return 'SettingsScreenViewState(showDecimal: $showDecimal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsScreenViewState &&
            const DeepCollectionEquality()
                .equals(other.showDecimal, showDecimal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showDecimal));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsScreenViewStateCopyWith<_$_SettingsScreenViewState>
      get copyWith =>
          __$$_SettingsScreenViewStateCopyWithImpl<_$_SettingsScreenViewState>(
              this, _$identity);
}

abstract class _SettingsScreenViewState extends SettingsScreenViewState {
  const factory _SettingsScreenViewState({required final bool showDecimal}) =
      _$_SettingsScreenViewState;
  const _SettingsScreenViewState._() : super._();

  @override
  bool get showDecimal;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsScreenViewStateCopyWith<_$_SettingsScreenViewState>
      get copyWith => throw _privateConstructorUsedError;
}
