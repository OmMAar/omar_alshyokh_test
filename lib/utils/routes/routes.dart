import 'package:omar_alshyokh_test/ui/home/pages/home_page.dart';
import 'package:omar_alshyokh_test/ui/profile/pages/user_details_page.dart';
import 'package:omar_alshyokh_test/ui/main/main_root.dart';
import 'package:omar_alshyokh_test/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/ui/user_management/pages/main_login_page.dart';

import 'package:omar_alshyokh_test/ui/user_management/pages/sign_in_page.dart';


class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';

  /// user management pages
  static const String mainLoginPage = '/login/pages/mainLoginPage';
  static const String signInPage = '/login/pages/SignInPage';

  /// main pages
  static const String mainRootPage = '/ui/MainRootPage/';
  static const String home = '/home';
  static const String userDetailsPage = '/UserDetailsPage';





  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),

    mainLoginPage: (BuildContext context) => MainLoginPage(),
    signInPage: (BuildContext context) => SignInPage(),


    mainRootPage: (BuildContext context) => MainRootPage(),
    home: (BuildContext context) => HomeScreen(),
    userDetailsPage: (BuildContext context) => UserDetailsPage(),

  };

}



