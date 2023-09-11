import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    // prefs.setString("Token", data["data"]["access_token"]);
    return data;
  }
}
