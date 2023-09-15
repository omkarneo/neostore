import 'package:flutter/material.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/view/productdetailed/widget/quantitydialog.dart';
import 'package:neostore/view/productdetailed/widget/ratediolog.dart';

class OrderButtons extends StatefulWidget {
  final data;
  const OrderButtons({super.key, this.data});

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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => QuantityDialog(data: widget.data),
              );
            },
            child: Text(
              "BUY NOW",
              style: TextStyle(color: colorPrimaryText, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              fixedSize: MaterialStateProperty.all(const Size(180, 55)),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
            ),
            onPressed: () async {
              var data = await showDialog(
                context: context,
                builder: (context) => RateDialog(data: widget.data),
              );
              if (data != null) {
                var snackBar = SnackBar(
                  content: Text(data["user_msg"]),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
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
