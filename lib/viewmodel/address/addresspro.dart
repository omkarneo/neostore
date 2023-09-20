import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';

final addressprovider = ChangeNotifierProvider((ref) => address());

class address extends ChangeNotifier {
  var alladdress = [];
  var selectedaddress = "";

  fetchaddress() {
    var presiststorage = jsonDecode(LocalPreference.getProfile()!);
    alladdress = presiststorage["address"];
    notifyListeners();
  }

  addaddress(data) {
    var presiststorage = jsonDecode(LocalPreference.getProfile()!);
    presiststorage["address"].add(data);
    LocalPreference.setProfile(jsonEncode(presiststorage));
    fetchaddress();
  }

  removeaddress(index) {
    var presiststorage = jsonDecode(LocalPreference.getProfile()!);
    presiststorage["address"].removeAt(index);
    LocalPreference.setProfile(jsonEncode(presiststorage));
    fetchaddress();
  }

  setaddress(val) {
    selectedaddress = val;
    notifyListeners();
  }
}
