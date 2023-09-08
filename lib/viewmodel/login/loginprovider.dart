import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/model/login/login_api.dart';

final loginprovider = ChangeNotifierProvider(
  (ref) => Login(),
);

class Login extends ChangeNotifier {
  final LoginApiservices apiservices = LoginApiservices();

  getlogin(data) async {
    var formdata = FormData.fromMap(data);
    // print(formdata);
    var res = await apiservices.login(formdata);
    return jsonDecode(res);
  }
}
