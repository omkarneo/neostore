import 'package:dio/dio.dart';

class OrderApiService {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  orderservice(formdata, token) async {
    var res = await dio.post("$baseurl/trainingapp/api/order",
        data: formdata,
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
    return res.data;
  }

  orderlistservice(token) async {
    var res = await dio.get("$baseurl/trainingapp/api/orderList",
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }

  orderdetailedservice(token, id) async {
    var res = await dio.get("$baseurl/trainingapp/api/orderDetail?order_id=$id",
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }
}
