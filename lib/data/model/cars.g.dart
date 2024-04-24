// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cars _$CarsFromJson(Map<String, dynamic> json) => Cars(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$CarsToJson(Cars instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imagePath': instance.imagePath,
    };
