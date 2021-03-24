part of 'baglist_bloc.dart';

abstract class BaglistState extends Equatable {
  const BaglistState();

  @override
  List<Object> get props => [];
}

class BaglistInitial extends BaglistState {}

class BaglistLoading extends BaglistState {}

class BaglistLoaded extends BaglistState {
  final List<BagEntity> bags;
  final double totalCost;

  const BaglistLoaded({required this.bags, this.totalCost = 0});
}

class BaglistError extends BaglistState {
  final String message;
  const BaglistError({required this.message});
}
