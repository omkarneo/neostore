import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/cart/cart_api.dart';

final cartprovider = ChangeNotifierProvider(
  (ref) => Cart(),
);

class Cart extends ChangeNotifier {
  List? cartproduct;
  var total = 0;
  bool cartloadingstate = false;
  CartApiService apiService = CartApiService();

  fetchcartitems(token) async {
    var res = await apiService.fetchcartitemsservice(token);
    var converttomap = jsonDecode(res);
    total = 0;
    if (converttomap['status'] == 200) {
      if (converttomap['data'] != null) {
        var data = [];
        for (var element in converttomap['data']) {
          data.add(CartModel.fromJson(element));
          total += int.parse(element['product']["sub_total"].toString());
        }
        cartproduct = data;
      } else if (converttomap['message'] == "Cart Empty" &&
          converttomap['data'] == null) {
        cartproduct = [];
      } else {
        cartproduct = null;
      }
      cartloadingstate = false;
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
    cartloadingstate = true;
    notifyListeners();
    fetchcartitems(token);
    return jsonDecode(res);
  }

  edititemcart(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.edititemcartservice(formdata, token);
    cartloadingstate = true;
    notifyListeners();
    fetchcartitems(token);
    return jsonDecode(res);
  }

  orderitems(data, token) async {
    var formdata = FormData.fromMap(data);
    var res = await apiService.orderservice(formdata, token);
    fetchcartitems(token);
    notifyListeners();
    return jsonDecode(res);
  }
}

class CartModel {
  int? id;
  int? productid;
  int? quantity;
  String? productname;
  String? productCategory;
  int? cost;
  String? productimages;
  int? alltotal;
  CartModel(
      {this.id,
      this.productid,
      this.quantity,
      this.productname,
      this.cost,
      this.productimages,
      this.alltotal,
      this.productCategory});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productid: json["product_id"],
        quantity: json['quantity'],
        productname: json['product']["name"],
        cost: json['product']["cost"],
        productCategory: json['product']["product_category"],
        productimages: json['product']["product_images"],
        alltotal: json['product']["sub_total"],
      );
}
