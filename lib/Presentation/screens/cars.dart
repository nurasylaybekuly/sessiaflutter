import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/cars_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/cars_event.dart';
import 'package:flutter_carwash/Presentation/bloc/cars_state.dart';
import 'package:flutter_carwash/Presentation/widgets/carswidget.dart';
import 'package:flutter_carwash/data/repository/carsapi.dart';
import 'package:flutter_carwash/data/repository/carsrepository.dart';
import 'package:flutter_carwash/domain/usecase/carsusecase.dart';
import 'package:dio/dio.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiClient = CarsApi(dio);
    return BlocProvider(
      create: (context) => CarsBloc(
        getCarsUseCase: GetCarsUseCase(
          CarsRepository(apiClient),
        ),
      )..add(CarsLoad()),
      child: Scaffold(
        body: BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state is CarsLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CarsLoadSuccess) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  final cars = state.cars[index];
                  return CarsWidget(cars: cars);
                },
              );
            } else if (state is CarsLoadFailure) {
              return Center(child: Text('Ошибка'));
            } else {
              return Center(child: Text('Перезагрузите страницу'));
            }
          },
        ),
      ),
    );
  }
}
