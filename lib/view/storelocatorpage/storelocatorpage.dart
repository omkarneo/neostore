import 'package:flutter/material.dart';

import '../../core/utils/staticdata.dart';

class StoreLocator extends StatefulWidget {
  const StoreLocator({super.key});

  @override
  State<StoreLocator> createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("Store Locator"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
    );
  }
}
