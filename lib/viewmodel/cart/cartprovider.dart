import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/cart/cart_api.dart';

final cartprovider = ChangeNotifierProvider(
  (ref) => Cart(),
);

class Cart extends ChangeNotifier {
  List cartproduct = [];
  var total = 0;
  List allorder = [];
  Map orderdetailedd = {};
  CartApiService apiService = CartApiService();

  fetchcartitems(token) async {
    var res = await apiService.fetchcartitemsservice(token);
    var converttomap = jsonDecode(res);
    if (converttomap['status'] == 200) {
      if (converttomap['data'] != null) {
        cartproduct = converttomap['data'];
        total = converttomap["total"];
      } else {
        cartproduct = [];
        total = 0;
      }

      notifyListeners();
    }
  }

  addtocart(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.addtocardservice(formdata, token);
    fetchcartitems(token);
    return jsonDecode(res);
  }

  removeitemcart(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.removecartitemservice(formdata, token);
    fetchcartitems(token);
    notifyListeners();
    return jsonDecode(res);
  }

  edititemcart(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.edititemcartservice(formdata, token);
    fetchcartitems(token);
    notifyListeners();
    return jsonDecode(res);
  }

  orderitems(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.orderservice(formdata, token);
    fetchcartitems(token);
    orderlist(token);
    notifyListeners();
    return jsonDecode(res);
  }

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
