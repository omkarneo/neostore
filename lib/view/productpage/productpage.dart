import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/dashboard/dashboardprovider.dart';
import '../../viewmodel/product/productspro.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("Tables"),
        // leading: Consumer(
        //   builder: (context, ref, child) => IconButton(
        //     icon: (ref.watch(dashboardpro).isCollapsed)
        //         ? const Icon(Icons.menu)
        //         : const Icon(Icons.arrow_back_ios_new_sharp),
        //     onPressed: () {
        //       // ref.read(dashboardpro).Collapsed(widget.controller);
        //     },
        //   ),
        // ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        // print(ref.read(productprovider).fetchproducts());
        return FutureBuilder(
            future: ref.read(productprovider).fetchproducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List;
                print(data[0].rating.runtimeType);
                // List<dynamic> data = snapshot.data;
                // print(data.length);

                return ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 1,
                          color: Colors.grey,
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) => SizedBox(
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
                                      style: TextStyle(
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
                                          SizedBox(
                                            width: 20,
                                          ),
                                          // Spacer(),
                                          RatingBarIndicator(
                                            rating: data[index].rating,
                                            itemCount: 5,
                                            itemSize: 30,
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
                        ));
              }
              return Text("${snapshot}");
            });
      }),
    );
  }
}
