// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_screen_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsScreenAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Toggle value) toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Toggle value)? toggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Toggle value)? toggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsScreenActionCopyWith<$Res> {
  factory $SettingsScreenActionCopyWith(SettingsScreenAction value,
          $Res Function(SettingsScreenAction) then) =
      _$SettingsScreenActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsScreenActionCopyWithImpl<$Res>
    implements $SettingsScreenActionCopyWith<$Res> {
  _$SettingsScreenActionCopyWithImpl(this._value, this._then);

  final SettingsScreenAction _value;
  // ignore: unused_field
  final $Res Function(SettingsScreenAction) _then;
}

/// @nodoc
abstract class _$$ToggleCopyWith<$Res> {
  factory _$$ToggleCopyWith(_$Toggle value, $Res Function(_$Toggle) then) =
      __$$ToggleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleCopyWithImpl<$Res>
    extends _$SettingsScreenActionCopyWithImpl<$Res>
    implements _$$ToggleCopyWith<$Res> {
  __$$ToggleCopyWithImpl(_$Toggle _value, $Res Function(_$Toggle) _then)
      : super(_value, (v) => _then(v as _$Toggle));

  @override
  _$Toggle get _value => super._value as _$Toggle;
}

/// @nodoc

class _$Toggle implements Toggle {
  const _$Toggle();

  @override
  String toString() {
    return 'SettingsScreenAction.toggle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Toggle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggle,
  }) {
    return toggle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? toggle,
  }) {
    return toggle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Toggle value) toggle,
  }) {
    return toggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Toggle value)? toggle,
  }) {
    return toggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Toggle value)? toggle,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(this);
    }
    return orElse();
  }
}

abstract class Toggle implements SettingsScreenAction {
  const factory Toggle() = _$Toggle;
}
