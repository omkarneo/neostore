import 'package:dio/dio.dart';

class RegisterApiservices {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  Future register(formdata) async {
    var res = await dio.post("$baseurl/trainingapp/api/users/register",
        data: formdata,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return res.data;
  }
}
