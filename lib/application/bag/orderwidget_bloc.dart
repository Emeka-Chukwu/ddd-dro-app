import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dro/domain/bag/bag.dart';
import 'package:equatable/equatable.dart';

part 'orderwidget_event.dart';
part 'orderwidget_state.dart';

class OrderwidgetBloc extends Bloc<OrderwidgetEvent, OrderwidgetState> {
  OrderwidgetBloc({required this.initialState}) : super(initialState);
  final OrderwidgetState initialState;

  @override
  Stream<OrderwidgetState> mapEventToState(
    OrderwidgetEvent event,
  ) async* {
    if (event is ShowBagOptions) {
      yield OrderwidgetInitial();
      yield OrderWidgetShowState(
        id: event.id,
        entity: event.entity,
      );
    } else if (event is AddSubtractBagOption) {
      yield OrderwidgetInitial();
      // ignore: unnecessary_statements
      event.add ? event.entity.quantity++ : event.entity.quantity--;
      yield OrderWidgetShowState(
        id: event.id,
        entity: event.entity,
      );
    } else if (event is FetchBagData) {
      yield OrderwidgetInitial();
    }
  }
}
