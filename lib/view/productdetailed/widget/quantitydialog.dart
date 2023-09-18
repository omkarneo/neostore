// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/viewmodel/cart/cartprovider.dart';

import '../../../core/utils/staticdata.dart';

class QuantityDialog extends StatefulWidget {
  final data;
  const QuantityDialog({super.key, this.data});

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  TextEditingController quatity = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    quatity.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    quatity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Form(
          key: formKey,
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
            Image.network(
              widget.data.product_images[0]["image"],
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
                  width: 120,
                  height: 50,
                  child: Material(
                    child: TextFormField(
                      controller: quatity,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(0))),
                      validator: (value) {
                        if (value == "") {
                          return "Enter a Number";
                        } else if (int.parse(value!) >= 5) {
                          return "Should be less than 6";
                        }
                        return null;
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
                      if (formKey.currentState!.validate()) {
                        dynamic snackBar;
                        var res = await ref.watch(cartprovider).addtocart({
                          "product_id": widget.data.id,
                          "quantity": int.parse(quatity.text)
                        }, LocalPreference.getToken());
                        if (res["status"] == 200) {
                          snackBar = SnackBar(
                            content: Text(res["user_msg"]),
                          );
                        } else {
                          snackBar = const SnackBar(
                            content: Text("Something Went Wrong"),
                          );
                        }
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      ],
    );
    // return AlertDialog(actions: [
    //   Center(
    //     child: Container(
    //       width: MediaQuery.sizeOf(context).width / 1.1,
    //       height: MediaQuery.sizeOf(context).height / 1.4,
    //       decoration: BoxDecoration(
    //           color: colorPrimaryText, borderRadius: BorderRadius.circular(10)),
    //       child: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Column(children: [
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             widget.data.name,
    //             style: const TextStyle(
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.w400,
    //                 color: Colors.black87),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           Container(
    //             width: MediaQuery.sizeOf(context).width / 1.4,
    //             height: MediaQuery.sizeOf(context).height / 3.5,
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: NetworkImage(
    //                         widget.data.product_images[0]["image"]),
    //                     fit: BoxFit.fill)),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Center(
    //             child: Column(children: [
    //               Text(
    //                 "Enter Qty",
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w400,
    //                     color: Colors.grey.shade700),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               SizedBox(
    //                 width: 100,
    //                 height: 50,
    //                 child: Material(
    //                   child: TextFormField(
    //                     decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                             borderSide:
    //                                 BorderSide(color: Colors.black, width: 2),
    //                             borderRadius: BorderRadius.circular(0))),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               TextButton(
    //                 style: ButtonStyle(
    //                   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10))),
    //                   fixedSize: MaterialStateProperty.all(Size(180, 55)),
    //                   backgroundColor: MaterialStateProperty.all(colorPrimary),
    //                 ),
    //                 onPressed: () {},
    //                 child: Text(
    //                   "SUBMIT",
    //                   style: TextStyle(color: colorPrimaryText, fontSize: 20),
    //                 ),
    //               ),
    //             ]),
    //           )
    //         ]),
    //       ),
    //     ),
    //   ),
    // ]);
  }
}
