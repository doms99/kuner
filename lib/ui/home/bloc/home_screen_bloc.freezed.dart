// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenEvent {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) pageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? pageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? pageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChange value) pageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenEventCopyWith<HomeScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$HomeScreenEventCopyWithImpl<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  final HomeScreenEvent _value;
  // ignore: unused_field
  final $Res Function(HomeScreenEvent) _then;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PageChangeCopyWith<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  factory _$$_PageChangeCopyWith(
          _$_PageChange value, $Res Function(_$_PageChange) then) =
      __$$_PageChangeCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class __$$_PageChangeCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$$_PageChangeCopyWith<$Res> {
  __$$_PageChangeCopyWithImpl(
      _$_PageChange _value, $Res Function(_$_PageChange) _then)
      : super(_value, (v) => _then(v as _$_PageChange));

  @override
  _$_PageChange get _value => super._value as _$_PageChange;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$_PageChange(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageChange implements _PageChange {
  const _$_PageChange(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'HomeScreenEvent.pageChanged(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageChange &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$_PageChangeCopyWith<_$_PageChange> get copyWith =>
      __$$_PageChangeCopyWithImpl<_$_PageChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) pageChanged,
  }) {
    return pageChanged(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? pageChanged,
  }) {
    return pageChanged?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? pageChanged,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChange value) pageChanged,
  }) {
    return pageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChanged,
  }) {
    return pageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChanged,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(this);
    }
    return orElse();
  }
}

abstract class _PageChange implements HomeScreenEvent {
  const factory _PageChange(final int page) = _$_PageChange;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_PageChangeCopyWith<_$_PageChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeScreenState {
  int get currentPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
  $Res call({int currentPage});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeScreenStateCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$$_HomeScreenStateCopyWith(
          _$_HomeScreenState value, $Res Function(_$_HomeScreenState) then) =
      __$$_HomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentPage});
}

/// @nodoc
class __$$_HomeScreenStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$$_HomeScreenStateCopyWith<$Res> {
  __$$_HomeScreenStateCopyWithImpl(
      _$_HomeScreenState _value, $Res Function(_$_HomeScreenState) _then)
      : super(_value, (v) => _then(v as _$_HomeScreenState));

  @override
  _$_HomeScreenState get _value => super._value as _$_HomeScreenState;

  @override
  $Res call({
    Object? currentPage = freezed,
  }) {
    return _then(_$_HomeScreenState(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeScreenState implements _HomeScreenState {
  const _$_HomeScreenState({required this.currentPage});

  @override
  final int currentPage;

  @override
  String toString() {
    return 'HomeScreenState(currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeScreenState &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      __$$_HomeScreenStateCopyWithImpl<_$_HomeScreenState>(this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState({required final int currentPage}) =
      _$_HomeScreenState;

  @override
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
