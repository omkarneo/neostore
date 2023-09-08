import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/register/register_api.dart';

final registerprovider = ChangeNotifierProvider(
  (ref) => null,
);

final termsprovider = ChangeNotifierProvider((ref) => Terms());

final genderprovider = ChangeNotifierProvider((ref) => Gender());

class Gender extends ChangeNotifier {
  String gender = "M";
  void action(val) {
    gender = val;
    notifyListeners();
  }
}

class Terms extends ChangeNotifier {
  bool check = false;

  void action() {
    if (check == false) {
      check = true;
    } else {
      check = false;
    }
    notifyListeners();
  }
}

class Register extends ChangeNotifier {
  final RegisterApiservices apiservices = RegisterApiservices();
  register(data) async {
    var formdata = FormData.fromMap(data);
    var res = await apiservices.register(formdata);
    return res;
  }
}
