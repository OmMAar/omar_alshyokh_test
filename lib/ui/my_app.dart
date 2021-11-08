import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omar_alshyokh_test/blocs/application/application_bloc.dart';
import 'package:omar_alshyokh_test/blocs/application/application_state.dart';
import 'package:omar_alshyokh_test/blocs/main/root_page_bloc.dart';
import 'package:omar_alshyokh_test/constants/app_theme.dart';
import 'package:omar_alshyokh_test/constants/strings.dart';
import 'package:omar_alshyokh_test/data/repo/repository.dart';
import 'package:omar_alshyokh_test/di/components/service_locator.dart';
import 'package:omar_alshyokh_test/state/category_store.dart';
import 'package:omar_alshyokh_test/ui/splash/splash.dart';
import 'package:omar_alshyokh_test/utils/routes/routes.dart';
import 'package:omar_alshyokh_test/stores/language/language_store.dart';
import 'package:omar_alshyokh_test/stores/theme/theme_store.dart';
import 'package:omar_alshyokh_test/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),

      child: StoreProvider<AppState>(
        store: Redux.store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: _themeStore.darkMode ? themeDataDark : themeData,
          routes: Routes.routes,
          locale: Locale(_languageStore.locale),
          supportedLocales: _languageStore.supportedLanguages
              .map((language) => Locale(language.locale!, language.code))
              .toList(),
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            // Built-in localization of basic text for Cupertino widgets
            GlobalCupertinoLocalizations.delegate,
          ],
          home: SplashScreen(),
        ),
      ),
    );
  }
}