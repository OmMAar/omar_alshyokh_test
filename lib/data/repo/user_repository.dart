import 'dart:async';
import 'package:dio/dio.dart';
import 'package:omar_alshyokh_test/data/local/datasources/user/user_datasource.dart';
import 'package:omar_alshyokh_test/data/network/apis/user/user_api.dart';
import 'package:omar_alshyokh_test/data/sharedpref/shared_preference_helper.dart';
import 'package:omar_alshyokh_test/models/user/user_info_response_model.dart';


class UserRepository {
  // data source object
  final UserDataSource _userDataSource;

  // api objects
  final UserApi _userApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  UserRepository(
      this._userApi, this._sharedPrefsHelper, this._userDataSource);

  Future<UserInfoResponseModel> getUserListWithPaged(
      {required Map<String, dynamic> queryParameters,required CancelToken cancelToken}) async {
    var _result = await _userApi.getUserListWithPaged(
        queryParameters: queryParameters,cancelToken: cancelToken);
    return _result;
  }

}
