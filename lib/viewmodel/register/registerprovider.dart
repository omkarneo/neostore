import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/shared_preference.dart';
import '../../model/register/register_api.dart';

final registerprovider = ChangeNotifierProvider(
  (ref) => Register(),
);

class Register extends ChangeNotifier {
  final RegisterApiservices apiservices = RegisterApiservices();
  String gender = "M";
  bool check = false;
  void genderaction(val) {
    gender = val;
    notifyListeners();
  }

  void checkaction() {
    if (check == false) {
      check = true;
    } else {
      check = false;
    }
    notifyListeners();
  }

  register(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var formdata = FormData.fromMap(data);
    var res = await apiservices.register(formdata);
    data = jsonDecode(res);
    if (data["status"] == 200) {
      LocalPreference.setToken(data["data"]["access_token"]);
      LocalPreference.setphoto(data["data"]["profile_pic"]);
      LocalPreference.setname(
          "${data["data"]["first_name"]} ${data["data"]["last_name"]}");
      LocalPreference.setmail(data["data"]["email"]);
    }

    return data;
  }
}
