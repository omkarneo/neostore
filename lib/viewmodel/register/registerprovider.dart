import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    var formdata = FormData.fromMap(data);
    var res = await apiservices.register(formdata);
    data = jsonDecode(res);
    if (data["status"] == 200) {
      Map<String, dynamic> profile = {
        "Name": "${data["data"]["first_name"]} ${data["data"]["last_name"]}",
        "Email": data["data"]["email"],
        "photo": (data["data"]["profile_pic"] == null)
            ? ""
            : data["data"]["profile_pic"],
        "Token": data["data"]["access_token"]
      };
      String encodedMap = json.encode(profile);
      LocalPreference.setProfile(encodedMap);
    }

    return data;
  }
}
