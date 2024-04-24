import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_state.dart';
import 'package:flutter_carwash/generated/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Uint8List _imageData = Uint8List(0);

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imageDataString = prefs.getString('user_image_data');
    if (imageDataString != null) {
      setState(() {
        _imageData = Uint8List.fromList(imageDataString.codeUnits);
      });
    } else {
      setState(() {
        _imageData = Uint8List(0);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageData = await pickedFile.readAsBytes();
      setState(() {
        _imageData = Uint8List.fromList(imageData);
      });
      final prefs = await SharedPreferences.getInstance();
      final imageDataString = String.fromCharCodes(imageData);
      await prefs.setString('user_image_data', imageDataString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/image/gta.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: _imageData.isNotEmpty
                                        ? DecorationImage(
                                            image: MemoryImage(_imageData),
                                            fit: BoxFit.cover,
                                          )
                                        : DecorationImage(
                                            image: AssetImage(
                                                'assets/image/back.png'),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(LocaleKeys.name.tr(),
                                        style: TextStyle(
                                            fontFamily: 'RacingSansOne',
                                            fontSize: 20.0)),
                                    Text(
                                      state.name,
                                      style: TextStyle(
                                          fontFamily: 'RacingSansOne',
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(LocaleKeys.number.tr(),
                                        style: TextStyle(
                                            fontFamily: 'RacingSansOne',
                                            fontSize: 20.0)),
                                    Text(
                                      state.phoneNumber,
                                      style: TextStyle(
                                          fontFamily: 'RacingSansOne',
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(LocaleKeys.mail.tr(),
                                        style: TextStyle(
                                            fontFamily: 'RacingSansOne',
                                            fontSize: 20.0)),
                                    Text(
                                      state.email,
                                      style: TextStyle(
                                          fontFamily: 'RacingSansOne',
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(LocaleKeys.city.tr(),
                                        style: TextStyle(
                                            fontFamily: 'RacingSansOne',
                                            fontSize: 20.0)),
                                    Text(
                                      state.country,
                                      style: TextStyle(
                                          fontFamily: 'RacingSansOne',
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
