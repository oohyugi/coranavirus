import 'dart:convert';

import 'package:flutter/services.dart';

class UrlConfigBean {
  ProdBean prod;
  DevBean dev;

  static UrlConfigBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UrlConfigBean urlConfigBean = UrlConfigBean();
    urlConfigBean.prod = ProdBean.fromMap(map['prod']);
    urlConfigBean.dev = DevBean.fromMap(map['dev']);
    return urlConfigBean;
  }

  Map toJson() => {
        "prod": prod,
        "dev": dev,
      };
}

class DevBean {
  String baseUrl;

  static DevBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DevBean devBean = DevBean();
    devBean.baseUrl = map['base_url'];
    return devBean;
  }

  Map toJson() => {
        "base_url": baseUrl,
      };
}

class ProdBean {
  String baseUrl;

  static ProdBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProdBean prodBean = ProdBean();
    prodBean.baseUrl = map['base_url'];
    return prodBean;
  }

  Map toJson() => {
        "base_url": baseUrl,
      };
}

const bool isProduction = bool.fromEnvironment('dart.vm.product');

Future<String> getBaseUrl() async {
  var url = await load("assets/env_config.json");

  if (isProduction) {
    return url.prod.baseUrl;
  } else {
    return url.dev.baseUrl;
  }
}

Future<UrlConfigBean> load(String path) {
  return rootBundle.loadStructuredData(path, (jsonStr) async {
    final url = UrlConfigBean.fromMap(json.decode(jsonStr));
    return url;
  });
}
