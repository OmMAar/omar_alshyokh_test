import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:omar_alshyokh_test/blocs/simple_bloc_delegate.dart';
import 'package:omar_alshyokh_test/state/category_store.dart';
import 'package:omar_alshyokh_test/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/components/service_locator.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ],
);
void setupBloc() {
  Bloc.observer = SimpleBlocObserver();
}
Future<void> main() async {
  await Redux.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await setPreferredOrientations();
  await setupLocator();
  setupBloc();
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);
}

// keytool -genkey -v -keystore ~/omar_alshyokh_test_key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddebugKey
