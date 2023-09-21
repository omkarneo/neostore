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
      body: Column(children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg",
                  ),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.pin_drop, size: 50),
                title: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "SKYLAND STORE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "9th floor, Business arcade, Sayani Rd, Parel Bus Depot, Dighe Nagar, Prabhadevi, Mumbai, Maharashtra 400025",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.pin_drop, size: 50),
                title: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "WOODMOUNT STORE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.pin_drop, size: 50),
                title: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "NATUFUR STORE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Forrest Ray 191-103 Integer Rd. Corona New Mexico 08219 (404) 960-3807",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.pin_drop, size: 50),
                title: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "LAVANDER STORE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Hiroko Potter P.O. Box 887 2508 Dolor. Av. Muskegon KY 12482 (314) 244-6306",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
