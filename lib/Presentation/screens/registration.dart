import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_event.dart';
import 'package:flutter_carwash/Presentation/bloc/user_state.dart';
import 'package:flutter_carwash/Presentation/screens/bottom.dart';
import 'package:flutter_carwash/Presentation/screens/lan.dart';
import 'package:flutter_carwash/data/model/usermodel.dart';
import 'package:flutter_carwash/generated/locale_keys.g.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lifeStoryController = TextEditingController();

  final List<String> _countries = [
    'Almaty',
    'Astana',
    'Shymkent',
    'Aktobe',
    'Taraz',
    'Pavlodar',
    'Kostanay',
    'Semei',
  ];
  String _selectedCountry = 'Almaty';

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _lifeStoryController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoaded) {
            _nameController.text = state.name;
            _phoneNumberController.text = state.phoneNumber;
            _emailController.text = state.email;
            _selectedCountry = state.country;
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/back1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/image/logo.png',
                    height: 170.0,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                      color: Colors.grey.withOpacity(0.8),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  focusNode: _nameFocus,
                                  autofocus: true,
                                  onFieldSubmitted: (_) {
                                    _fieldFocusChange(
                                        context, _nameFocus, _phoneFocus);
                                  },
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.username.tr(),
                                    prefixIcon:
                                        Icon(Icons.person, color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => newUser.name = value!,
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  focusNode: _phoneFocus,
                                  autofocus: true,
                                  onFieldSubmitted: (_) {
                                    _fieldFocusChange(
                                        context, _nameFocus, _phoneFocus);
                                  },
                                  controller: _phoneNumberController,
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.usernumber.tr(),
                                    prefixIcon:
                                        Icon(Icons.phone, color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => newUser.phone = value!,
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.usermail.tr(),
                                    prefixIcon:
                                        Icon(Icons.email, color: Colors.white),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => newUser.email = value!,
                                ),
                                SizedBox(height: 10.0),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.usercity.tr(),
                                  ),
                                  items: _countries.map((country) {
                                    return DropdownMenuItem(
                                      child: Text(country),
                                      value: country,
                                    );
                                  }).toList(),
                                  onChanged: (country) {
                                    print(country);
                                    setState(() {
                                      _selectedCountry = country as String;
                                      newUser.country = country;
                                    });
                                  },
                                  value: _selectedCountry,
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: LocaleKeys.userpassword.tr(),
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.white),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (value.length < 8) {
                                      return 'Password must be at least 8 characters long';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<UserBloc>().add(SaveUser(
                                          _nameController.text,
                                          _phoneNumberController.text,
                                          _emailController.text,
                                          _selectedCountry));

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Bottom(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    LocaleKeys.register.tr(),
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                Lang()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
