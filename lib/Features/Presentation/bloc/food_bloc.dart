import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Features/Domain/entity/Food.dart';

import '../../Domain/usecase/getAllProducts.dart';

part 'food_event.dart';
part 'food_state.dart';


class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetProductAllUsecase getProductAllUsecase;

  // Combine all use cases in a single constructor
  FoodBloc({
    required this.getProductAllUsecase,

  }) : super(FoodInitial()) {
    // Event handlers
    on<StarterEvent>(_onStarterEvent);
  }

  // Handler for StarterEvent
  Future<void> _onStarterEvent(
      StarterEvent event, Emitter<FoodState> emit) async {
    print('object hello get Product');
    emit(FoodInitial());

    var result = await getProductAllUsecase.execute();

    result.fold(
          (l) => emit(LoadHomeFailure(l.message)),
          (r) => emit(LoadedHomeState(r)),
    );
  }
}

