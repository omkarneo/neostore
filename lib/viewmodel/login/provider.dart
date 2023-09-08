import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/model/login/remote/base_api.dart';

final LoginProvider = ChangeNotifierProvider(
  (ref) => login(),
);

class login extends ChangeNotifier {
  late Apiservices apiservices;

  getlogin(data) async {
    var res = await apiservices.login(data);
    return res;
  }
}
