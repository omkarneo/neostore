import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/utils/staticdata.dart';

class TopDetailedConatiner extends StatefulWidget {
  final data;
  const TopDetailedConatiner({super.key, this.data});

  @override
  State<TopDetailedConatiner> createState() => _TopDetailedConatinerState();
}

class _TopDetailedConatinerState extends State<TopDetailedConatiner> {
  Map types = {"1": "Tables", "2": "Chairs", "3": "Sofas", "5": "Dinning Sets"};
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 7.35,
      color: colorPrimaryText,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Category - ${types[widget.data.product_category_id.toString()]}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data.producer,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                RatingBarIndicator(
                  rating: widget.data.rating,
                  itemCount: 5,
                  itemSize: 23,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
