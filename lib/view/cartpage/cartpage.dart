// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/view/cartpage/widget/carttile.dart';
import 'package:neostore/viewmodel/address/addresspro.dart';
import 'package:neostore/viewmodel/cart/cartprovider.dart';

import '../../core/utils/staticdata.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  int total = 0;
  @override
  Widget build(BuildContext context) {
    List? prodata = ref.watch(cartprovider).cartproduct;
    var total = ref.watch(cartprovider).total;
    bool loadingstate = ref.watch(cartprovider).cartloadingstate;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorPrimary,
          shadowColor: Colors.transparent,
          title: const Text("My Cart"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: (prodata != null)
            ? (prodata.isNotEmpty)
                ? Column(
                    children: [
                      (loadingstate)
                          ? LinearProgressIndicator(
                              color: colorPrimary,
                            )
                          : const SizedBox(),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 1.5,
                        child: ListView.separated(
                            itemCount: prodata.length,
                            separatorBuilder: (context, index) => Container(
                                  height: 1,
                                  color: Colors.grey.shade400,
                                ),
                            itemBuilder: (context, index) {
                              var data = prodata[index];

                              return Cartdetailed(data: data);
                            }),
                      ),
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
                                "₹ $total",
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
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  (loadingstate) ? Colors.grey : colorPrimary,
                              fixedSize: Size(
                                  MediaQuery.sizeOf(context).width - 30, 60)),
                          onPressed: (loadingstate)
                              ? null
                              : () async {
                                  ref.read(addressprovider).fetchaddress();
                                  Navigator.pushNamed(
                                      context, RoutePaths.addresspage);
                                },
                          child: Text(
                            "ORDER NOW",
                            style: TextStyle(
                                color: colorPrimaryText, fontSize: 25),
                          ))
                    ],
                  )
                : const Center(
                    child: Text("No Item in Cart"),
                  )
            : Center(
                child: CircularProgressIndicator(color: colorPrimary),
              ));
  }
}
