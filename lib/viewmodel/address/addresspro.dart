import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';

final addressprovider = ChangeNotifierProvider((ref) => address());

class address extends ChangeNotifier {
  var alladdress = [];
  var selectedaddress = "";

  fetchaddress() {
    if (LocalPreference.getaddress() != null) {
      List presiststorage = jsonDecode(LocalPreference.getaddress()!);
      alladdress = presiststorage;
      notifyListeners();
    }
  }

  addaddress(data) {
    if (LocalPreference.getaddress() == null) {
      LocalPreference.setaddress(jsonEncode([data]));
      fetchaddress();
    } else {
      List presiststorage = jsonDecode(LocalPreference.getaddress()!);
      presiststorage.add(data);
      LocalPreference.setaddress(jsonEncode(presiststorage));
      fetchaddress();
    }
  }

  removeaddress(index) {
    List presiststorage = jsonDecode(LocalPreference.getaddress()!);
    presiststorage.removeAt(index);
    LocalPreference.setProfile(jsonEncode(presiststorage));
    fetchaddress();
  }

  setaddress(val) {
    selectedaddress = val;
    notifyListeners();
  }
}
