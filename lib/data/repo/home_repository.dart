import 'package:omar_alshyokh_test/data/local/datasources/home/home_datasource.dart';
import 'package:omar_alshyokh_test/data/network/apis/home/home_api.dart';
import 'package:omar_alshyokh_test/data/sharedpref/shared_preference_helper.dart';


class HomeRepository {
  // data source object
  final HomeDataSource _homeDataSource;

  // api objects
  final HomeApi _homeApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  HomeRepository(this._homeApi, this._sharedPrefsHelper, this._homeDataSource);

  /// home EndPoints: ---------------------------------------------------------------------


}
