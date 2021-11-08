import 'package:omar_alshyokh_test/data/network/dio_client.dart';
import 'package:omar_alshyokh_test/data/network/rest_client.dart';


class HomeApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  HomeApi(this._dioClient, this._restClient);


}
