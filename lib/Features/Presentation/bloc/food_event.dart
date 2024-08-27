part of 'food_bloc.dart';

sealed class FoodEvent extends Equatable {
  const FoodEvent();
}

class StarterEvent extends FoodEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}