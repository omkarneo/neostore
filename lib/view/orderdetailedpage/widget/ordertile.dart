// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Ordertile extends StatefulWidget {
  final data;
  const Ordertile({super.key, this.data});

  @override
  State<Ordertile> createState() => _OrdertileState();
}

class _OrdertileState extends State<Ordertile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      image: NetworkImage(widget.data['prod_image']),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data['prod_name'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "(${widget.data['prod_cat_name']})",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - 125,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "QTY : ${widget.data['quantity']}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600),
                        ),
                        Text(
                          "₹ ${widget.data['total']}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
