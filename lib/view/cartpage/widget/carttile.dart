// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/viewmodel/cart/cartprovider.dart';

import '../../../core/utils/staticdata.dart';

class Cartdetailed extends StatefulWidget {
  final data;
  const Cartdetailed({super.key, this.data});

  @override
  State<Cartdetailed> createState() => _CartdetailedState();
}

class _CartdetailedState extends State<Cartdetailed> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: Center(
              child: Builder(builder: (context) {
                return Consumer(
                  builder: (context, ref, child) => InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      ref.read(cartprovider).removeitemcart(
                          {"product_id": widget.data.productid},
                          LocalPreference.getToken());
                    },
                  ),
                );
              }),
            ),
          )
        ],
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.data.productimages),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.productname,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.data.productCategory,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  Consumer(
                    builder: (context, ref, child) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width - 125,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 33,
                              color: Colors.grey.shade300,
                              child: Center(
                                child: DropdownButton<String>(
                                  value: "${widget.data.quantity}",
                                  items: <String>[
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                    '6',
                                    '7',
                                    '8',
                                    '9'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    ref.read(cartprovider).edititemcart({
                                      "product_id": widget.data.productid,
                                      "quantity": newValue
                                    }, LocalPreference.getToken());
                                  },
                                ),
                              ),
                            ),
                            Text(
                              "₹ ${widget.data.alltotal}",
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
