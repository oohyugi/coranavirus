import 'package:dio/dio.dart';

import 'dio_config.dart';

class ApiServices {
  final String baseUrl;

  ApiServices({this.baseUrl});

  Future<Response<Map>> getMain() async {
    print(baseUrl);
    return addInterceptors(dio: createDio(baseUrl), isRequireAuth: false)
        .get("/api");
  }
  Future<Response> getDailyUpdate() async {
    print(baseUrl);
    return addInterceptors(dio: createDio(baseUrl), isRequireAuth: false)
        .get("/api/daily");
  }
  Future<Response> getConfirmed() async {
    print(baseUrl);
    return addInterceptors(dio: createDio(baseUrl), isRequireAuth: false)
        .get("/api/confirmed");
  }
}
