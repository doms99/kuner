part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required int currentPage,
  }) = _HomeScreenState;

  factory HomeScreenState.initial() {
    return const HomeScreenState(currentPage: 0);
  }
}
