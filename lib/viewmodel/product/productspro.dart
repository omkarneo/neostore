import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/products/product_api.dart';

final productprovider = ChangeNotifierProvider(
  (ref) => Product(),
);

class Product extends ChangeNotifier {
  final ProductApiservices apiservices = ProductApiservices();
  int index = 0;

  photoindexchange(val) {
    index = val;
    notifyListeners();
  }

  fetchproducts(id) async {
    var res = await apiservices.get(id);
    var contomap = jsonDecode(res);
    var data = [];

    for (int i = 0; i < contomap['data'].length; i++) {
      var d = contomap['data'][i];
      print(d["rating"].runtimeType);
      data.add(ProductModel(
          d["id"],
          d["name"],
          d["producer"],
          d["cost"],
          d["product_images"],
          d["rating"].toDouble(),
          d["description"],
          d["created"],
          d["modified"],
          d["view_count"],
          d["product_category_id"]));
    }
    print(data);
    return data;
  }

  getdetailed(id) async {
    var res = await apiservices.getone(id);
    var contomap = jsonDecode(res);
    var data = contomap["data"];
    ProductModel model = ProductModel(
        data['id'],
        data['name'],
        data['producer'],
        data['cost'],
        data["product_images"],
        data["rating"].toDouble(),
        data["description"],
        data["created"],
        data["modified"],
        data["view_count"],
        data["product_category_id"]);
    return model;
  }
}

class ProductModel {
  int id;
  String name;
  String producer;
  var product_images;
  double rating;
  int cost;
  String description;
  int view_count;
  String created;
  String modified;
  int product_category_id;

  ProductModel(
      this.id,
      this.name,
      this.producer,
      this.cost,
      this.product_images,
      this.rating,
      this.description,
      this.created,
      this.modified,
      this.view_count,
      this.product_category_id);
}
