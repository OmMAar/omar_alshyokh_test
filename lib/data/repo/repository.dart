import 'dart:async';
import 'package:dio/dio.dart';
import 'package:omar_alshyokh_test/data/local/datasources/app/app_datasource.dart';
import 'package:omar_alshyokh_test/data/network/apis/app/app_api.dart';
import 'package:omar_alshyokh_test/data/sharedpref/shared_preference_helper.dart';
import 'package:omar_alshyokh_test/models/category/category_list_response_model.dart';

class Repository {
  // data source object
  final AppDataSource _dashboardDataSource;

  // api objects
  final AppApi _appApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._appApi, this._sharedPrefsHelper, this._dashboardDataSource);

  Future<CategoryListResponseModel> getCategories(
      {required CancelToken cancelToken}) async {
    var _result = await _appApi.getCategories(cancelToken: cancelToken);
    return _result;
  }
  // Theme: -----------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}