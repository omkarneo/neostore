import 'package:flutter/material.dart';

import '../../../core/utils/staticdata.dart';

class QuantityDialog extends StatefulWidget {
  final data;
  const QuantityDialog({super.key, this.data});

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
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
                  "Enter Qty",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Material(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(0))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    fixedSize: MaterialStateProperty.all(Size(180, 55)),
                    backgroundColor: MaterialStateProperty.all(colorPrimary),
                  ),
                  onPressed: () {},
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(color: colorPrimaryText, fontSize: 20),
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
