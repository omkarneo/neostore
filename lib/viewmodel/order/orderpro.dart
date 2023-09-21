import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/order/order_api.dart';

final orderprovider = ChangeNotifierProvider((ref) => Order());

class Order extends ChangeNotifier {
  List allorder = [];
  Map orderdetailedd = {};
  OrderApiService apiService = OrderApiService();

  orderlist(token) async {
    var res = await apiService.orderlistservice(token);
    var converttomap = jsonDecode(res);
    print(converttomap);
    if (converttomap['status'] == 200) {
      if (converttomap['data'] != null) {
        allorder = converttomap['data'];
      } else {
        allorder = [];
      }
      notifyListeners();
    }
  }

  orderdetailed(token, id) async {
    var res = await apiService.orderdetailedservice(token, id);
    var converttomap = jsonDecode(res);
    print(converttomap);
    if (converttomap['status'] == 200) {
      if (converttomap['data'] != null) {
        orderdetailedd = converttomap['data'];
      } else {
        orderdetailedd = {};
      }
      notifyListeners();
    }
  }
}

class OrderModel {
  int? id;
  int? cost;
  String? created;

  OrderModel({
    this.id,
    this.cost,
    this.created,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        cost: json["cost"],
        created: json["created"],
      );
}
