import 'dart:convert';

import 'package:dio/dio.dart';

class ProductApiservices {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  get(id) async {
    var res = await dio.get(
        "$baseurl/trainingapp/api/products/getList?product_category_id=$id",
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }
}
