import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/product/productspro.dart';

class ProductPage extends StatefulWidget {
  final id;
  const ProductPage({super.key, this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map types = {"1": "Tables", "2": "Chairs", "3": "Sofas", "5": "Dinning Sets"};

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
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        return FutureBuilder(
            future: ref.read(productprovider).fetchproducts(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              "Rs. ${data[index].cost}",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                  color: colorPrimary),
                                            ),
                                            const SizedBox(
                                              width: 40,
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
                            Navigator.pushNamed(
                                context, RoutePaths.productdetailed,
                                arguments: data[index]);
                          },
                        ));
              }
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: colorPrimary,
                  ),
                ),
              );
            });
      }),
    );
  }
}
