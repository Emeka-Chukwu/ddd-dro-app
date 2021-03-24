part of 'productaddsub_bloc.dart';

abstract class ProductaddsubState extends Equatable {
  const ProductaddsubState();

  @override
  List<Object> get props => [];
}

class ProductaddsubInitial extends ProductaddsubState {}

class AddSubtractLoaded extends ProductaddsubState {
  final ProductEntity entity;

  const AddSubtractLoaded({required this.entity});
}
