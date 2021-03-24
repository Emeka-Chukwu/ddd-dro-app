part of 'menu_home_bloc.dart';

abstract class MenuHomeEvent extends Equatable {
  const MenuHomeEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends MenuHomeEvent {}

class SearchDataEvent extends MenuHomeEvent {
  final String text;

  const SearchDataEvent({required this.text});
}

class FilterDataEvent extends MenuHomeEvent {}

class SortDataEvent extends MenuHomeEvent {}
