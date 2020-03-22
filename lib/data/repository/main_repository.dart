import 'dart:convert';

import 'package:coranavirus/data/services/api_services.dart';
import 'package:coranavirus/data/services/url_config.dart';
import 'package:coranavirus/model/confirmed_mdl.dart';
import 'package:coranavirus/model/daily_summary_mdl.dart';
import 'package:coranavirus/model/main_mdl.dart';
import 'package:dio/dio.dart';

class MainRepository {
  Future<MainMdl> getAllData() async {
    var baseurl = await getBaseUrl();
    ApiServices apiService = ApiServices(baseUrl: baseurl);

    Response<Map> response = await apiService.getMain();
    print(response.data);
    if (response.data != null) {
      return MainMdl.fromMap(response.data);
    } else {
      return throw Exception("failed to load menus");
    }
  }

  Future<List<DailySummaryMdl>> getADaily() async {
    var baseurl = await getBaseUrl();
    List<DailySummaryMdl> list = List();
    ApiServices apiService = ApiServices(baseUrl: baseurl);

    Response response = await apiService.getDailyUpdate();
    if (response.data != null) {
      print("wewke $response");
      return List()..addAll(
          (response.data as List ?? []).map((o) => DailySummaryMdl.fromMap(o))
      );
    } else {
      return throw Exception("failed to load menus");
    }
  }

  Future<List<ConfirmedMdl>> getConfirmed() async {
    var baseurl = await getBaseUrl();
    List<DailySummaryMdl> list = List();
    ApiServices apiService = ApiServices(baseUrl: baseurl);

    Response response = await apiService.getConfirmed();
    if (response.data != null) {
      print("wewke $response");
      return List()..addAll(
          (response.data as List ?? []).map((o) => ConfirmedMdl.fromMap(o))
      );
    } else {
      return throw Exception("failed to load menus");
    }
  }
}
