import 'package:dio/dio.dart';
import 'package:flutter_carwash/data/model/cars.dart';
import 'package:flutter_carwash/data/repository/carsrepository.dart';

class CarsRepository {
  final CarsApi apiClient;

  CarsRepository(this.apiClient);

  Future<List<Cars>> getCards() async {
    try {
      final response = await apiClient.getCards();
      return response;
    } catch (e) {
      print('Ошибка при загрузке карточек: $e');

      if (e is DioError) {
        print('DioError: ${e.response}');
      }
      throw Exception('Ошибка загрузки данных');
    }
  }
}
