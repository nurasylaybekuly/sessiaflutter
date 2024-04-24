import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_bloc.dart';
import 'package:flutter_carwash/Presentation/bloc/user_event.dart';
import 'package:flutter_carwash/Presentation/bloc/user_state.dart';
import 'package:flutter_carwash/Presentation/screens/bottom.dart';
import 'package:flutter_carwash/Presentation/screens/registration.dart';
import 'package:flutter_carwash/firebase_options.dart';
import 'package:flutter_carwash/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('kk'), Locale('ru')],
        path: 'assets/translations',
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc()..add(LoadUser()),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          Widget home = RegistrationForm();
          if (state is UserLoaded) {
            home = Bottom();
          }
          return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: home);
        },
      ),
    );
  }
}
