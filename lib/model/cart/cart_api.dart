import 'package:dio/dio.dart';

class CartApiService {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();

  fetchcartitemsservice(token) async {
    var res = await dio.get("$baseurl/trainingapp/api/cart",
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }

  addtocardservice(formdata, token) async {
    var res = await dio.post("$baseurl/trainingapp/api/addToCart",
        data: formdata,
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
    return res.data;
  }

  removecartitemservice(formdata, token) async {
    var res = await dio.post("$baseurl/trainingapp/api/deleteCart",
        data: formdata,
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
    return res.data;
  }

  edititemcartservice(formdata, token) async {
    var res = await dio.post("$baseurl/trainingapp/api/editCart",
        data: formdata,
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
    return res.data;
  }
}
