part of 'orderwidget_bloc.dart';

abstract class OrderwidgetEvent extends Equatable {
  const OrderwidgetEvent();

  @override
  List<Object> get props => [];
}

class ShowBagOptions extends OrderwidgetEvent {
  final int id;
  final BagEntity entity;
  const ShowBagOptions({
    required this.id,
    required this.entity,
  });
}

class AddSubtractBagOption extends OrderwidgetEvent {
  final int id;
  final bool add;
  final BagEntity entity;
  const AddSubtractBagOption({
    required this.id,
    required this.add,
    required this.entity,
  });
}

class FetchBagData extends OrderwidgetEvent {}
