// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/product/productspro.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  final id;
  const ProductPage({super.key, this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map types = {"1": "Tables", "2": "Chairs", "3": "Sofas", "5": "Dinning Sets"};
  var formatter = NumberFormat('#,##,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorPrimary,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 20,
            ),
          ),
          title: Text(types[widget.id]),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: Consumer(builder: (context, ref, child) {
          final data = ref.watch(productprovider).allProduct;
          // print(data);
          if (data.isNotEmpty &&
              data[0].product_category_id.toString() == widget.id) {
            return ListView.separated(
                separatorBuilder: (context, index) => Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 1,
                      color: Colors.grey,
                    ),
                itemCount: data.length,
                itemBuilder: (context, index) => InkWell(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data[index].product_images),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    data[index].producer,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Rs. ${formatter.format(data[index].cost)}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                              color: colorPrimary),
                                        ),
                                        SizedBox(
                                          width:
                                              data[index].cost > 9999 ? 25 : 40,
                                        ),
                                        // Spacer(),
                                        RatingBarIndicator(
                                          rating: data[index].rating,
                                          itemCount: 5,
                                          itemSize: 25,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        ref.watch(productprovider).getdetailed(data[index].id);
                        Navigator.pushNamed(context, RoutePaths.productdetailed,
                            arguments: {
                              "name": data[index].name,
                              "id": data[index].id
                            });
                      },
                    ));
          }
          return Center(
            child: CircularProgressIndicator(color: colorPrimary),
          );
        }));
  }
}
