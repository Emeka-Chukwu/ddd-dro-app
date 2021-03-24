part of 'showsearch_bloc.dart';

abstract class ShowsearchEvent extends Equatable {
  const ShowsearchEvent();

  @override
  List<Object> get props => [];
}

class DisplaySearchEvent extends ShowsearchEvent {}

class ShowCancelIcon extends ShowsearchEvent {
  final String text;

  const ShowCancelIcon({required this.text});
}

class HideIconAndClearText extends ShowsearchEvent {}
