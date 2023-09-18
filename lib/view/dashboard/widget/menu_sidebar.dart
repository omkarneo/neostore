import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/viewmodel/cart/cartprovider.dart';
import 'package:neostore/viewmodel/dashboard/dashboardprovider.dart';

import '../../../core/Navigation/route_paths.dart';
import '../../../viewmodel/product/productspro.dart';
import 'menu_tile.dart';

class Menu extends StatefulWidget {
  final slideAnimation;
  final menuScaleAnimation;
  final controller;

  const Menu(
      {super.key,
      this.slideAnimation,
      this.menuScaleAnimation,
      this.controller});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var profile;

  @override
  void initState() {
    profile = jsonDecode(LocalPreference.getProfile()!);
    print(profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SlideTransition(
      position: widget.slideAnimation,
      child: ScaleTransition(
          scale: widget.menuScaleAnimation,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                profile['Name'],
                                // "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                profile["Email"],
                                // "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => SizedBox(
                    height: (isPortrait)
                        ? MediaQuery.sizeOf(context).height / 1.5
                        : MediaQuery.sizeOf(context).height / 2.2,
                    child: ListView(
                      children: [
                        Menutile(
                          name: "My Cart",
                          icon: Icons.shopping_cart,
                          action: () {
                            ref
                                .read(cartprovider)
                                .fetchcartitems(LocalPreference.getToken());
                            Navigator.pushNamed(context, RoutePaths.cartpage);
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "Tables",
                          icon: Icons.table_restaurant,
                          action: () {
                            ref.read(productprovider).fetchproducts("1");
                            Navigator.pushNamed(context, RoutePaths.productlist,
                                arguments: "1");
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "Sofas",
                          icon: Icons.chair,
                          action: () {
                            ref.read(productprovider).fetchproducts("3");
                            Navigator.pushNamed(context, RoutePaths.productlist,
                                arguments: "3");
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "Chairs",
                          icon: Icons.event_seat,
                          action: () {
                            ref.read(productprovider).fetchproducts("2");
                            Navigator.pushNamed(context, RoutePaths.productlist,
                                arguments: "2");
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "Dinning Sets",
                          icon: Icons.dining_rounded,
                          action: () {
                            ref.read(productprovider).fetchproducts("5");
                            Navigator.pushNamed(context, RoutePaths.productlist,
                                arguments: "5");
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "My Account",
                          icon: Icons.person,
                          action: () {},
                        ),
                        Menutile(
                          name: "Store Locator",
                          icon: Icons.location_on,
                          action: () {},
                        ),
                        Menutile(
                          name: "My Orders",
                          icon: Icons.paste,
                          action: () {
                            ref
                                .read(cartprovider)
                                .orderlist(LocalPreference.getToken());
                            Navigator.pushNamed(
                              context,
                              RoutePaths.orderpage,
                            );
                            ref
                                .watch(dashboardpro)
                                .Collapsed(widget.controller);
                          },
                        ),
                        Menutile(
                          name: "Logout",
                          icon: Icons.logout,
                          action: () async {
                            LocalPreference.setProfile("");
                            LocalPreference.setToken("");

                            ref.watch(dashboardpro).isCollapsed = true;
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutePaths.login,
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
