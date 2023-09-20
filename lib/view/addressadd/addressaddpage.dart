import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/addressadd/widget/inputforaddress.dart';
import 'package:neostore/viewmodel/address/addresspro.dart';

import '../../core/utils/staticdata.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({super.key});

  @override
  State<AddressAddPage> createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController country = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("Add Address"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                  contoller: address,
                )),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: AddressInputs(
                  label: "LANDMARK",
                  weight: MediaQuery.sizeOf(context).width,
                  contoller: landmark,
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AddressInputs(
                    label: "CITY",
                    weight: MediaQuery.sizeOf(context).width / 2.3,
                    contoller: city,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddressInputs(
                    label: "STATE",
                    weight: MediaQuery.sizeOf(context).width / 2.3,
                    contoller: state,
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
                    contoller: zip,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddressInputs(
                    label: "COUNTRY",
                    weight: MediaQuery.sizeOf(context).width / 2.3,
                    contoller: country,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      fixedSize:
                          Size(MediaQuery.sizeOf(context).width - 30, 60)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      ref.read(addressprovider).addaddress({
                        "address":
                            "${address.text}, ${landmark.text}, ${city.text}, ${state.text}, ${zip.text}, ${country.text}",
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "SAVE ADDRESS",
                    style: TextStyle(color: colorPrimaryText, fontSize: 25),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
