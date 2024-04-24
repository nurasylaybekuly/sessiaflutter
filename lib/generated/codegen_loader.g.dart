// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "username": "Write Your Name",
    "usernumber": "Write Your Number",
    "usermail": "Write Your Mail",
    "userpassword": "Create Password",
    "usercity": "Select City",
    "name": "Full Name",
    "number": "Phone Number",
    "city": "City",
    "mail": "Mail",
    "register": "Registration"
  };
  static const Map<String, dynamic> kk = {
    "username": "Аты Жөніңізді жазыңыз",
    "usernumber": "Нөміріңізді Енгізіңіз",
    "usermail": "Поштаңызды жазыңыз",
    "userpassword": "Құпия сөзді Құрастырыңыз",
    "usercity": "Қаланы Таңдаңыз",
    "name": "Аты Жөні",
    "number": "Телефон Нөмірі",
    "city": "Қала",
    "mail": "Пошта",
    "register": "Тіркелу"
  };
  static const Map<String, dynamic> ru = {
    "username": "Напишите ФИО",
    "usernumber": "Напишите Номер",
    "usermail": "Напишите Почту",
    "userpassword": "Придумайте Пароль",
    "usercity": "Выберите Город",
    "name": "ФИО",
    "number": "Номер Телефона",
    "city": "Город",
    "mail": "Почта",
    "register": "Регистрация"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
