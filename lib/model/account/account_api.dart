import 'package:dio/dio.dart';

class AccountApiservices {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  fetchservive(token) async {
    var res = await dio.get("$baseurl/trainingapp/api/users/getUserData",
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }

  updateservice(token, formdata) async {
    var res = await dio.post("$baseurl/trainingapp/api/users/update",
        data: formdata,
        options: Options(
          headers: {"access_token": token},
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }

  resetpasswordservice(token, formdata) async {
    var res = await dio.post("$baseurl/trainingapp/api/users/change",
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
