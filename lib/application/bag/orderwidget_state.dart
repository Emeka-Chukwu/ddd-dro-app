part of 'orderwidget_bloc.dart';

abstract class OrderwidgetState extends Equatable {
  const OrderwidgetState();

  @override
  List<Object> get props => [];
}

class OrderwidgetInitial extends OrderwidgetState {}

class OrderWidgetShowState extends OrderwidgetState {
  final int id;
  final BagEntity entity;
  const OrderWidgetShowState({
    required this.id,
    required this.entity,
  });
}
