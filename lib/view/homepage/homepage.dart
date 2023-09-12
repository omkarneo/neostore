import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/Navigation/route_paths.dart';
import '../../core/utils/staticdata.dart';
import '../../viewmodel/dashboard/dashboardprovider.dart';

class HomePage extends StatefulWidget {
  final controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Duration duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: duration,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      elevation: 10,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(color: colorPrimaryText),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Consumer(
                builder: (context, ref, child) => AppBar(
                  centerTitle: true,
                  backgroundColor: colorPrimary,
                  shadowColor: Colors.transparent,
                  title: const Text("NeoSTORE"),
                  leading: IconButton(
                    icon: (ref.watch(dashboardpro).isCollapsed)
                        ? const Icon(Icons.menu)
                        : const Icon(Icons.arrow_back_ios_new_sharp),
                    onPressed: () {
                      ref.read(dashboardpro).Collapsed(widget.controller);
                    },
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.search_rounded))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            gettoken();
                          },
                          child: const Text("Check Token"))),
                  Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("Token", "");
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, RoutePaths.login);
                          },
                          child: Text("Logout"))),
                ],
              ),
            ]),
          )),
    );
  }
}

gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString("Token"));
}
