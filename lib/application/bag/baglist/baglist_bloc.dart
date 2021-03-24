import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dro/domain/bag/bag.dart';
import 'package:dro/domain/bag/repository.dart';
import 'package:equatable/equatable.dart';

part 'baglist_event.dart';
part 'baglist_state.dart';

class BaglistBloc extends Bloc<BaglistEvent, BaglistState> {
  BaglistBloc({
    required this.initialState,
    required this.repository,
  }) : super(initialState);
  BaglistState initialState;
  BagRepository repository;

  @override
  Stream<BaglistState> mapEventToState(
    BaglistEvent event,
  ) async* {
    if (event is GetBagListEvent) {
      yield* getAllBag();
    } else if (event is AddToBagListEvent) {
      yield* addToBag(event.entity);
    } else if (event is DeleteFromBagListEvent) {
      yield* deleteFromBag(event.entity);
    } else if (event is CalculateTotalEvent) {
      yield* getTotalCost(event.entity);
    }
  }

  Stream<BaglistState> getTotalCost(List<BagEntity> bags) async* {
    yield BaglistLoading();
    final cost = repository.calculateTheTotalPrice(bags);
    yield BaglistLoaded(
      bags: bags,
      totalCost: cost,
    );
  }

  Stream<BaglistState> getAllBag() async* {
    yield BaglistLoading();
    final bags = repository.getBagList();
    // yield BaglistLoaded(bags: bags);
    yield* getTotalCost(bags);
  }

  Stream<BaglistState> addToBag(BagEntity entity) async* {
    yield BaglistLoading();
    final bags = repository.addProductToBag(entity);
    // yield BaglistLoaded(bags: bags);
    yield* getTotalCost(bags);
  }

  Stream<BaglistState> deleteFromBag(BagEntity entity) async* {
    // try {
    yield BaglistLoading();
    final bags = repository.deleteProductFromBag(entity);
    // yield BaglistLoaded(bags: bags);
    yield* getTotalCost(bags);
    // } catch (e) {
    // print(e.toString());
    // yield BaglistError(message: e.toString());
    // }
  }
}
