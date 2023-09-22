import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/model/account/account_api.dart';

final accountprovider = ChangeNotifierProvider((ref) => Account());

class Account extends ChangeNotifier {
  final AccountApiservices apiservices = AccountApiservices();
  UserData? user;
  String editimage = "";
  bool firstflag = false;

  fetchuser(token) async {
    user = null;
    firstflag = false;
    var res = await apiservices.fetchservive(token);
    var contomap = jsonDecode(res);
    print(contomap['data']);
    if (contomap['status'] == 200) {
      user = UserData.fromJson(contomap['data']["user_data"]);
      editimage = contomap['data']["user_data"]['profile_pic'] ?? "";
      notifyListeners();
    }
  }

  updateuser(token, map) async {
    var formdata = FormData.fromMap(map);
    var res = await apiservices.updateservice(token, formdata);

    Map contomap = jsonDecode(res);
    if (contomap['status'] == 200) {
      LocalPreference.setProfile("");
      LocalPreference.setToken("");
      return contomap;
    } else {
      return "Error";
    }
  }

  selectimage(val) {
    editimage = val;
    firstflag = true;
    notifyListeners();
  }
}

class UserData {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic profilePic;
  dynamic countryId;
  String? gender;
  String? phoneNo;
  dynamic dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;

  UserData({
    this.id,
    this.roleId,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.profilePic,
    this.countryId,
    this.gender,
    this.phoneNo,
    this.dob,
    this.isActive,
    this.created,
    this.modified,
    this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        roleId: json["role_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        profilePic: json["profile_pic"],
        countryId: json["country_id"],
        gender: json["gender"],
        phoneNo: json["phone_no"],
        dob: json["dob"],
        isActive: json["is_active"],
        created: json["created"],
        modified: json["modified"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "profile_pic": profilePic,
        "country_id": countryId,
        "gender": gender,
        "phone_no": phoneNo,
        "dob": dob,
        "is_active": isActive,
        "created": created,
        "modified": modified,
        "access_token": accessToken,
      };
}
