import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_alshyokh_test/blocs/application/application_bloc.dart';
import 'package:omar_alshyokh_test/blocs/application/application_events.dart';
import 'package:omar_alshyokh_test/common/widgets/vertical_padding.dart';
import 'package:omar_alshyokh_test/constants/app_assets.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/constants/colors.dart';
import 'package:omar_alshyokh_test/data/app_server_constants.dart';
import 'package:omar_alshyokh_test/data/repo/user_management_repository.dart';
import 'package:omar_alshyokh_test/di/components/service_locator.dart';
import 'package:omar_alshyokh_test/utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.mainStartBG,
                AppColors.mainEndBG,
              ],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // FadeInDownBig(
                    //   child: Container(
                    //     width: 200,
                    //     height: 200,
                    //     child: Text(
                    //       "My Structure",
                    //      style: appTextStyle.normalTSBasic.copyWith(
                    //        color: AppColors.mainColor,
                    //        fontWeight: FontWeight.bold
                    //      ),
                    //     ),
                    //   ),
                    //   duration: Duration(milliseconds: 1500),
                    // ),
                    // VerticalPadding(
                    //   percentage: 0.05,
                    // ),
                    Container(
                      width: double.infinity,
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 200), letter: "M"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 400), letter: "y"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 600), letter: " "),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 800), letter: "S"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 1000), letter: "t"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 1200), letter: "r"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 1400), letter: "c"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 1600), letter: "t"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 1800), letter: "u"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 2000), letter: "r"),
                          _buildLetterAnimated(
                              delay: Duration(milliseconds: 2200), letter: "e"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLetterAnimated(
      {required String letter, required Duration delay}) {
    return FadeInRight(
      delay: delay,
      child: Text(
        letter,
        style: appTextStyle.hugeTSBasic.copyWith(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    UserManagementRepository _repository = getIt<UserManagementRepository>();

    print("await __repository.authToken ${await _repository.authToken}");
    if (await (_repository.authToken) != null) {
      await Future.delayed(Duration(milliseconds: 2400), () {});
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else
      {
        await _repository.saveAuthToken(AppServerConstants.API_TOKEN);
        await Future.delayed(Duration(milliseconds: 2400), () {});
        Navigator.of(context).pushReplacementNamed(Routes.home);
    }

  }
}
