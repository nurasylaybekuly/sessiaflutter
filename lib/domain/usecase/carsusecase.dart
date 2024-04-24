import 'package:flutter_carwash/data/model/cars.dart';
import 'package:flutter_carwash/data/repository/carsapi.dart';

class GetCarsUseCase {
  final CarsRepository repository;

  GetCarsUseCase(this.repository);

  Future<List<Cars>> call() async {
    return repository.getCards();
  }
}
