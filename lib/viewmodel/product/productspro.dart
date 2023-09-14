import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/products/product_api.dart';

final productprovider = ChangeNotifierProvider(
  (ref) => Product(),
);

class Product extends ChangeNotifier {
  final ProductApiservices apiservices = ProductApiservices();

  fetchproducts(id) async {
    var res = await apiservices.get(id);
    var contomap = jsonDecode(res);
    var data = [];

    for (int i = 0; i < contomap['data'].length; i++) {
      var d = contomap['data'][i];
      print(d["rating"].runtimeType);
      data.add(ProductModel(d["name"], d["producer"], d["cost"],
          d["product_images"], d["rating"].toDouble()));
    }
    print(data);
    return data;
  }
}

class ProductModel {
  String name;
  String producer;
  String product_images;
  double rating;
  int cost;

  ProductModel(
      this.name, this.producer, this.cost, this.product_images, this.rating);
}
