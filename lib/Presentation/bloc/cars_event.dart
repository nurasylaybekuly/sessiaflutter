import 'package:equatable/equatable.dart';

abstract class CarsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CarsLoad extends CarsEvent {}
