import 'package:flutter/material.dart';
import 'package:neostore/core/Navigation/route_paths.dart';

import '../../core/utils/staticdata.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
      body: Column(children: []),
    );
  }
}
