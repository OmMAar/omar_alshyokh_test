import 'package:dio/dio.dart';
import 'package:omar_alshyokh_test/data/network/constants/endpoints.dart';
import 'package:omar_alshyokh_test/data/network/dio_client.dart';
import 'package:omar_alshyokh_test/data/network/rest_client.dart';
import 'package:omar_alshyokh_test/models/category/category_list_response_model.dart';


/// general app api here
class AppApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AppApi(this._dioClient, this._restClient);
  Future<CategoryListResponseModel> getCategories(
      {required CancelToken cancelToken}) async {
    try {
      final res = await _dioClient.get(Endpoints.getCategories, cancelToken: cancelToken);
      return CategoryListResponseModel.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

}
