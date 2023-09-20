import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/address/widget/radiotile.dart';
import 'package:neostore/viewmodel/address/addresspro.dart';

import '../../core/utils/staticdata.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: Text("Address List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePaths.addressaddpage);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Shipping Address",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 1.35,
          child: Consumer(
            // builder: (context, ref, child) =>
            // Text("${ref.watch(addressprovider).alladdress}"),
            builder: (context, ref, child) => ListView.builder(
              itemCount: ref.watch(addressprovider).alladdress.length,
              itemBuilder: (context, index) {
                return CustomRadioTile(
                  value: ref.watch(addressprovider).alladdress[index]
                      ['address'],
                  groupvalue: ref.watch(addressprovider).selectedaddress,
                  ref: ref,
                );
              },
            ),
          ),
        ),
        Center(
          child: Consumer(
            builder: (context, ref, child) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorPrimary,
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 30, 60)),
                onPressed: () async {
                  // dynamic snackBar;
                  // var res = await ref.read(cartprovider).orderitems({
                  //   'address':
                  //       "The Ruby, 29-Senapati Bapat Marg, Dadar (West)"
                  // }, LocalPreference.getToken());

                  // if (res["status"] == 200) {
                  //   snackBar = SnackBar(
                  //     content: Text(res["user_msg"]),
                  //   );
                  // } else {
                  //   snackBar = const SnackBar(
                  //     content: Text("Something Went Wrong"),
                  //   );
                  // }
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(color: colorPrimaryText, fontSize: 25),
                )),
          ),
        )
      ]),
    );
  }
}
