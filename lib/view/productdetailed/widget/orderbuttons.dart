import 'package:flutter/material.dart';
import 'package:neostore/core/utils/staticdata.dart';

class OrderButtons extends StatefulWidget {
  const OrderButtons({super.key});

  @override
  State<OrderButtons> createState() => _OrderButtonsState();
}

class _OrderButtonsState extends State<OrderButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 10,
      color: colorPrimaryText,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              fixedSize: MaterialStateProperty.all(Size(180, 55)),
              backgroundColor: MaterialStateProperty.all(colorPrimary),
            ),
            onPressed: () {},
            child: Text(
              "BUY NOW",
              style: TextStyle(color: colorPrimaryText, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              fixedSize: MaterialStateProperty.all(Size(180, 55)),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
            ),
            onPressed: () {},
            child: Text(
              "RATE",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
