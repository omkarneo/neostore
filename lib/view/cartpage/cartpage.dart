import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/utils/staticdata.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorPrimary,
          shadowColor: Colors.transparent,
          title: const Text("My Cart"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 2,
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                itemBuilder: (context, index) => Slidable(
                  closeOnScroll: true,
                  endActionPane: ActionPane(
                    extentRatio: 0.2,
                    motion: ScrollMotion(),
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        child: Center(
                          child: Builder(builder: (context) {
                            return InkWell(
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: colorPrimary,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              onTap: () {
                                // print("yo");
                              },
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 120,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pembroke",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "(Chair)",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade700),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 125,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 33,
                                        color: Colors.grey.shade300,
                                        child: Center(
                                          child: DropdownButton<String>(
                                            value: "1",
                                            items: <String>['1', '2', '3', '4']
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                              );
                                            }).toList(),
                                            // Step 5.
                                            onChanged: (String? newValue) {
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "₹ 45.00",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
