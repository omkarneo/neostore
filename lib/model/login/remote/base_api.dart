import 'package:dio/dio.dart';

class Apiservices {
  final String baseurl = "http://staging.php-dev.in:8844";
  final dio = Dio();
  Future login(data) async {
    var res =
        await dio.post("$baseurl/trainingapp/api/users/login", data: data);
    return res.data;
  }
}
