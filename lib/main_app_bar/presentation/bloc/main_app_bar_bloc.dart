import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_app_bar_event.dart';
part 'main_app_bar_state.dart';

class MainAppBarBloc extends Bloc<MainAppBarEvent, MainAppBarState> {
  @override
  MainAppBarState get initialState => ShowActions();

  @override
  Stream<MainAppBarState> mapEventToState(
    MainAppBarEvent event,
  ) async* {
    if (event is SearchButtonPressed) {
      yield ShowSearchTextField();
    }
    if (event is TextFieldBackButtonPressed) {
      yield ShowActions();
    }
    if (event is TextFieldSubmitted) {
      yield ShowActions();
    }
  }
}
