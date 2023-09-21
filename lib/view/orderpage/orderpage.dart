import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/viewmodel/cart/cartprovider.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/order/orderpro.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("My Orders"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        var allorders = ref.watch(orderprovider).allorder;
        return ListView.builder(
          itemCount: allorders.length,
          itemBuilder: (context, index) {
            var singleorder = allorders[index];
            return Consumer(
              builder: (context, ref, child) => InkWell(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order ID : ${singleorder['id']}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 160,
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Ordered Date : ${singleorder['created']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade700),
                                  )
                                ],
                              ),
                              Text(
                                "₹ ${singleorder['cost']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade700),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
                onTap: () {
                  ref.read(orderprovider).orderdetailed(
                      LocalPreference.getToken(), singleorder['id']);
                  Navigator.pushNamed(context, RoutePaths.orderdetailedpage,
                      arguments: singleorder['id']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
