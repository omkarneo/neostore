// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/viewmodel/product/productspro.dart';

import '../../../core/utils/staticdata.dart';

class RateDialog extends StatefulWidget {
  final data;
  const RateDialog({super.key, this.data});

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  double rate = 0;
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width / 1.1,
        height: MediaQuery.sizeOf(context).height / 1.6,
        decoration: BoxDecoration(
            color: colorPrimaryText, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.data.name,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 1.4,
              height: MediaQuery.sizeOf(context).height / 3.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.data.product_images[0]["image"]),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(children: [
                Text(
                  "Rate",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   width: MediaQuery.sizeOf(context).width / 1.4,
                //   height: 50,
                //   child: Center(
                //     child: RatingBarIndicator(
                //       rating: widget.data.rating,
                //       itemCount: 5,
                //       itemSize: 50,
                //       physics: const BouncingScrollPhysics(),
                //       itemBuilder: (context, _) => const Icon(
                //         Icons.star,
                //         color: Colors.amber,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  height: 50,
                  child: Center(
                    child: RatingBar.builder(
                      itemSize: 50,
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                        flag = true;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      fixedSize: MaterialStateProperty.all(const Size(180, 55)),
                      backgroundColor: MaterialStateProperty.all(colorPrimary),
                    ),
                    onPressed: () async {
                      dynamic ress;
                      if (flag) {
                        ress = await ref.read(productprovider).ratting({
                          "product_id": widget.data.id,
                          "rating": rate.toInt()
                        }, widget.data.product_category_id);
                        Navigator.pop(context, ress);
                      } else {
                        Navigator.pop(context, ress);
                      }
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: colorPrimaryText, fontSize: 20),
                    ),
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
