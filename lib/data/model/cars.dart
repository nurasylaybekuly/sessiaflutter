import 'package:json_annotation/json_annotation.dart';

part 'cars.g.dart';

@JsonSerializable()
class Cars {
  final int id;
  final String? title;
  final String? description;
  final String? imagePath;

  Cars({required this.id, this.title, this.description, this.imagePath});

  factory Cars.fromJson(Map<String, dynamic> json) => _$CarsFromJson(json);
  Map<String, dynamic> toJson() => _$CarsToJson(this);
}
