part of 'productaddsub_bloc.dart';

abstract class ProductaddsubEvent extends Equatable {
  const ProductaddsubEvent();

  @override
  List<Object> get props => [];
}

class AddSubtractEvent extends ProductaddsubEvent {
  final bool add;
  final ProductEntity entity;

  const AddSubtractEvent({this.add = true, required this.entity});
}
