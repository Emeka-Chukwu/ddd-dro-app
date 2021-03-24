part of 'showsearch_bloc.dart';

abstract class ShowsearchState extends Equatable {
  const ShowsearchState();

  @override
  List<Object> get props => [];
}

class ShowsearchInitial extends ShowsearchState {}

class ShowsearchEnabled extends ShowsearchState {
  final String text;
  const ShowsearchEnabled({required this.text});
}

class ShowIconState extends ShowsearchState {}

class HideIconState extends ShowsearchState {}
