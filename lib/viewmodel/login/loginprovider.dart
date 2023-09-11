import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/model/login/login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginprovider = ChangeNotifierProvider(
  (ref) => Login(),
);

class Login extends ChangeNotifier {
  final LoginApiservices apiservices = LoginApiservices();
  String? Token = "";

  getlogin(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var formdata = FormData.fromMap(data);
    // print(formdata);
    var res = await apiservices.login(formdata);
    data = jsonDecode(res);
    prefs.setString("Token", data["data"]["access_token"]);
    return data;
  }
}
