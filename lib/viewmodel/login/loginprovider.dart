// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/model/login/login_api.dart';

final loginprovider = ChangeNotifierProvider(
  (ref) => Login(),
);

class Login extends ChangeNotifier {
  final LoginApiservices apiservices = LoginApiservices();
  String? Token = "";

  getlogin(data) async {
    var formdata = FormData.fromMap(data);
    // print(formdata);
    var res = await apiservices.login(formdata);
    data = jsonDecode(res);
    if (data["status"] == 200) {
      Map<String, dynamic> Profile = {
        "Name": "${data["data"]["first_name"]} ${data["data"]["last_name"]}",
        "Email": data["data"]["email"],
        "photo": (data["data"]["profile_pic"] == null)
            ? ""
            : data["data"]["profile_pic"],
        "Token": data["data"]["access_token"],
      };
      LocalPreference.setToken(data["data"]["access_token"]);
      String encodedMap = json.encode(Profile);
      LocalPreference.setProfile(encodedMap);
    }
    return data;
  }
}
