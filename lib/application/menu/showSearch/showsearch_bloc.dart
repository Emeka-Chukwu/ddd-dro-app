import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'showsearch_event.dart';
part 'showsearch_state.dart';

class ShowsearchBloc extends Bloc<ShowsearchEvent, ShowsearchState> {
  final ShowsearchState initialState;
  ShowsearchBloc({required this.initialState}) : super(initialState);

  @override
  Stream<ShowsearchState> mapEventToState(
    ShowsearchEvent event,
  ) async* {
    if (event is DisplaySearchEvent) {
      yield ShowsearchInitial();
      yield const ShowsearchEnabled(text: "");
    } else if (event is ShowCancelIcon) {
      if (event.text.isNotEmpty) {
        yield ShowIconState();
      } else {
        yield HideIconState();
      }
    } else if (event is HideIconAndClearText) {
      yield HideIconState();
    }
  }
}
