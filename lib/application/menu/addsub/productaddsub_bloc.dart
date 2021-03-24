import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dro/domain/menu/product.dart';
import 'package:equatable/equatable.dart';

part 'productaddsub_event.dart';
part 'productaddsub_state.dart';

class ProductaddsubBloc extends Bloc<ProductaddsubEvent, ProductaddsubState> {
  final ProductaddsubState initialState;
  ProductaddsubBloc({required this.initialState}) : super(initialState);

  @override
  Stream<ProductaddsubState> mapEventToState(
    ProductaddsubEvent event,
  ) async* {
    if (event is AddSubtractEvent) {
      yield ProductaddsubInitial();
      event.add ? event.entity.quantity++ : event.entity.quantity--;
      yield AddSubtractLoaded(entity: event.entity);
    }
  }
}
