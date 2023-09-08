import 'package:dio/dio.dart';

class Apiservices {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  Future login(formdata) async {
    var res = await dio.post("$baseurl/trainingapp/api/users/login",
        data: formdata,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
    if (res.statusCode == 200) {
      // print(res.data);
      return res.data;
    } else if (res.statusCode == 401) {
      // print("wrong Password");
      // print(res);
      return res.data;
    }
  }
}
