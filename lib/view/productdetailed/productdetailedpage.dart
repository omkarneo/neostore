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
  Widget build(BuildContext context) {
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
        title: Text(widget.data.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: FutureBuilder(
        future: ref.read(productprovider).getdetailed(widget.data.id),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopDetailedConatiner(
                    data: snapshot.data,
                  ),
                  PhotoDescription(
                    data: snapshot.data,
                  ),
                  OrderButtons()
                ]);
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
        },
      ),
    );
  }
}
