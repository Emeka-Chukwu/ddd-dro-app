part of 'menu_home_bloc.dart';

abstract class MenuHomeState extends Equatable {
  const MenuHomeState();

  @override
  List<Object> get props => [];
}

class MenuHomeInitial extends MenuHomeState {}

class MenuHomeLoading extends MenuHomeState {}

class DataLoaded extends MenuHomeState {
  final List<ProductEntity> products;
  final String text;

  const DataLoaded({required this.products, this.text = ''});
  @override
  List<Object> get props => [products];
}

// class FetchDataEvent extends MenuHomeEvent {}

// class SearchDataEvent extends MenuHomeEvent {}

// class FilterDataEvent extends MenuHomeEvent {}

// class SortDataEvent extends MenuHomeEvent {}
