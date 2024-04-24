import 'package:equatable/equatable.dart';
import 'package:flutter_carwash/data/model/cars.dart';

abstract class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object> get props => [];
}

class CarsInitial extends CarsState {}

class CarsLoadInProgress extends CarsState {}

class CarsLoadSuccess extends CarsState {
  final List<Cars> cars;

  const CarsLoadSuccess([this.cars = const []]);

  @override
  List<Object> get props => [cars];
}

class CarsLoadFailure extends CarsState {}
