class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://reqres.in/api";

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 300000;

  /// user endPoint
  static const String userList = baseUrl + "/users";
  static const String getCategories = "https://api.zipconnect.app/api/v1/category/";



}