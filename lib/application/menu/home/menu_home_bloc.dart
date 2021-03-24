import 'dart:async';
import 'package:dro/domain/menu/product.dart';
import 'package:bloc/bloc.dart';
import 'package:dro/domain/menu/repository.dart';
import 'package:equatable/equatable.dart';

part 'menu_home_event.dart';
part 'menu_home_state.dart';

class MenuHomeBloc extends Bloc<MenuHomeEvent, MenuHomeState> {
  MenuHomeBloc({
    required this.initialState,
    required this.repository,
  }) : super(initialState);
  final MenuHomeState initialState;
  final MenuRespository repository;

  @override
  Stream<MenuHomeState> mapEventToState(
    MenuHomeEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield* _getAllProducts();
    } else if (event is SearchDataEvent) {
      yield* _searchedAllProducts(event.text);
    }
  }

  Stream<MenuHomeState> _getAllProducts() async* {
    yield MenuHomeLoading();
    final products = repository.getAllProducts();
    yield DataLoaded(products: products);
  }

  Stream<MenuHomeState> _searchedAllProducts(String text) async* {
    // yield MenuHomeLoading();
    final products = repository.getSearchedProducts(text);
    yield DataLoaded(products: products, text: text);
  }
}
