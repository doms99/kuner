import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

typedef State = HomeScreenState;
typedef Event = HomeScreenEvent;

class HomeScreenBloc extends Bloc<Event, State> {
  HomeScreenBloc() : super(State.initial()) {
    on<Event>((event, emit) async {
      FutureOr<State> newState = event.when(
        pageChanged: (page) => _onPageChange(page),
      );

      emit(await newState);
    });
  }

  State _onPageChange(int page) {
    return state.copyWith(currentPage: page);
  }
}
