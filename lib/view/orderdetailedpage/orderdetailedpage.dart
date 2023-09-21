// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/orderdetailedpage/widget/ordertile.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/order/orderpro.dart';

class OrderDetailedPage extends ConsumerStatefulWidget {
  final id;
  const OrderDetailedPage({super.key, this.id});

  @override
  ConsumerState<OrderDetailedPage> createState() => _OrderDetailedPageState();
}

class _OrderDetailedPageState extends ConsumerState<OrderDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorPrimary,
          shadowColor: Colors.transparent,
          title: Text(
              "Order ID : ${ref.watch(orderprovider).orderdetailedd['id']}"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: (widget.id == ref.watch(orderprovider).orderdetailedd['id'])
            ? Column(children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 1.3,
                    child: ListView.separated(
                      itemCount: ref
                          .watch(orderprovider)
                          .orderdetailedd["order_details"]
                          .length,
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      itemBuilder: (context, index) => Ordertile(
                          data: ref
                              .watch(orderprovider)
                              .orderdetailedd['order_details'][index]),
                    )),
                Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "TOTAL",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹ ${ref.watch(orderprovider).orderdetailedd['cost']}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ])
            : Center(
                child: CircularProgressIndicator(
                  color: colorPrimary,
                ),
              ));
  }
}
