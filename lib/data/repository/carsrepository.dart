import 'package:flutter_carwash/data/model/cars.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'carsrepository.g.dart';

@RestApi(
    baseUrl: "https://catwash-default-rtdb.europe-west1.firebasedatabase.app/")
abstract class CarsApi {
  factory CarsApi(Dio dio, {String baseUrl}) = _CarsApi;

  @GET("/Cars.json")
  Future<List<Cars>> getCards();
}
