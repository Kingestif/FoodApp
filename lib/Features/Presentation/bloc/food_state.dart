part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();
}

final class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class LoadedHomeState extends FoodState{
  final List<Product> products;
  const LoadedHomeState(this.products);
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class LoadHomeFailure extends FoodState {
  final String message;
  const LoadHomeFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}