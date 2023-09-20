import 'package:flutter/material.dart';
import 'package:neostore/view/address/addressadd/widget/inputforaddress.dart';

import '../../../core/utils/staticdata.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({super.key});

  @override
  State<AddressAddPage> createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("Add Address"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: AddressInputs(
                label: "ADDRESS",
                weight: MediaQuery.sizeOf(context).width,
                maxline: 5,
                minline: 3,
              )),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: AddressInputs(
                label: "CITY",
                weight: MediaQuery.sizeOf(context).width,
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddressInputs(
                  label: "CITY",
                  weight: MediaQuery.sizeOf(context).width / 2.3,
                ),
                const SizedBox(
                  width: 10,
                ),
                AddressInputs(
                  label: "STATE",
                  weight: MediaQuery.sizeOf(context).width / 2.3,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddressInputs(
                  label: "ZIP CODE",
                  weight: MediaQuery.sizeOf(context).width / 2.3,
                ),
                const SizedBox(
                  width: 10,
                ),
                AddressInputs(
                  label: "COUNTRY",
                  weight: MediaQuery.sizeOf(context).width / 2.3,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                  fixedSize: Size(MediaQuery.sizeOf(context).width - 30, 60)),
              onPressed: () async {},
              child: Text(
                "SAVE ADDRESS",
                style: TextStyle(color: colorPrimaryText, fontSize: 25),
              ))
        ]),
      ),
    );
  }
}
