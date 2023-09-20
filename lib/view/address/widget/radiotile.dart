import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/viewmodel/address/addresspro.dart';

class CustomRadioTile extends StatefulWidget {
  final value;
  final groupvalue;
  final ref;
  const CustomRadioTile({super.key, this.value, this.groupvalue, this.ref});

  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  var data;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: (ref.watch(addressprovider).selectedaddress ==
                            widget.value)
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        : Container(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.28,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Omkar Parekh",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.close))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                widget.value,
                                // softWrap: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          ref.read(addressprovider).setaddress(widget.value);
        },
      ),
    );
  }
}
