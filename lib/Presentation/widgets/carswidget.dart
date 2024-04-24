import 'package:flutter/material.dart';
import 'package:flutter_carwash/data/model/cars.dart';

class CarsWidget extends StatelessWidget {
  final Cars cars;

  const CarsWidget({Key? key, required this.cars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          cars.imagePath != null
              ? Image.asset(
                  cars.imagePath!,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                )
              : SizedBox(
                  height: 200, child: Center(child: Text('Отсутствует Фото'))),
          ListTile(
            title: Text(
              cars.title ?? 'Отсутствует Название',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(
              cars.description ?? 'Отсутствует Описание',
              style: TextStyle(color: Colors.grey[600]),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ],
      ),
    );
  }
}
