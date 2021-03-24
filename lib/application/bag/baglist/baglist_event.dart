part of 'baglist_bloc.dart';

abstract class BaglistEvent extends Equatable {
  const BaglistEvent();

  @override
  List<Object> get props => [];
}

class GetBagListEvent extends BaglistEvent {}

class AddToBagListEvent extends BaglistEvent {
  final BagEntity entity;

  const AddToBagListEvent({required this.entity});
}

class DeleteFromBagListEvent extends BaglistEvent {
  final BagEntity entity;

  const DeleteFromBagListEvent({required this.entity});
}

class CalculateTotalEvent extends BaglistEvent {
  final List<BagEntity> entity;

  const CalculateTotalEvent({required this.entity});
}
