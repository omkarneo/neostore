// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/productdetailed/widget/orderbuttons.dart';
import 'package:neostore/view/productdetailed/widget/photo_description.dart';
import 'package:neostore/view/productdetailed/widget/top_conatiner.dart';
import 'package:neostore/viewmodel/product/productspro.dart';

import '../../core/utils/staticdata.dart';

class ProductDetailed extends ConsumerStatefulWidget {
  final data;
  const ProductDetailed({super.key, this.data});

  @override
  ConsumerState<ProductDetailed> createState() => _ProductDetailedState();
}

class _ProductDetailedState extends ConsumerState<ProductDetailed> {
  @override
  void initState() {
    ref.read(productprovider).getdetailed(widget.data["id"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var providerdata = ref.watch(productprovider).oneProduct;
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorPrimary,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              ref.read(productprovider).photoindexchange(0);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 20,
            ),
          ),
          title: Text(widget.data["name"]),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: (providerdata != null && providerdata.id == widget.data["id"])
            ? SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopDetailedConatiner(
                        data: providerdata,
                      ),
                      PhotoDescription(
                        data: providerdata,
                      ),
                      OrderButtons(
                        data: providerdata,
                      )
                    ]),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: colorPrimary,
                ),
              ));
  }
}
