import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/viewmodel/product/productspro.dart';
import 'package:intl/intl.dart';

class PhotoDescription extends ConsumerStatefulWidget {
  final data;
  const PhotoDescription({super.key, this.data});

  @override
  ConsumerState<PhotoDescription> createState() => _PhotoDescriptionState();
}

class _PhotoDescriptionState extends ConsumerState<PhotoDescription> {
  var formatter = NumberFormat('#,##,000');
  @override
  Widget build(BuildContext context) {
    print(widget.data.product_images.length);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colorPrimaryText,
            ),
            height: MediaQuery.sizeOf(context).height / 2.4,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. ${formatter.format(widget.data.cost)}",
                      style: TextStyle(
                          fontSize: 30,
                          color: colorPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 1.5,
                      height: MediaQuery.sizeOf(context).width / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.data.product_images[
                                  ref.watch(productprovider).index]["image"]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.data.product_images.map<Widget>((data) {
                      return InkWell(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: MediaQuery.sizeOf(context).width / 5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(data["image"]),
                                  fit: BoxFit.fill)),
                        ),
                        onTap: () {
                          print("hello");
                          ref.read(productprovider).photoindexchange(
                              widget.data.product_images.indexOf(data));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colorPrimaryText,
            ),
            height: MediaQuery.sizeOf(context).height / 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "DESCRIPTION",
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.data.description,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
