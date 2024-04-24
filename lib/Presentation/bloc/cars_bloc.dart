import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/cars_event.dart';
import 'package:flutter_carwash/Presentation/bloc/cars_state.dart';
import 'package:flutter_carwash/domain/usecase/carsusecase.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetCarsUseCase getCarsUseCase;

  CarsBloc({required this.getCarsUseCase}) : super(CarsInitial()) {
    on<CarsLoad>(_onCardLoad);
  }

  void _onCardLoad(CarsLoad event, Emitter<CarsState> emit) async {
    try {
      emit(CarsLoadInProgress());
      final cars = await getCarsUseCase.call();
      emit(CarsLoadSuccess(cars));
    } catch (e) {
      print('Error in CardBloc: $e');
      emit(CarsLoadFailure());
    }
  }
}
