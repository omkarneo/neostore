import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/viewmodel/dashboard/dashboardprovider.dart';

import '../../../core/Navigation/route_paths.dart';
import 'menu_tile.dart';

class Menu extends StatefulWidget {
  final slideAnimation;
  final menuScaleAnimation;

  const Menu({super.key, this.slideAnimation, this.menuScaleAnimation});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var name;
  var photo;
  var email;

  @override
  void initState() {
    name = LocalPreference.getname()!;
    photo = LocalPreference.getphoto()!;
    email = LocalPreference.getmail()!;
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          // (LocalPreference
                                          // .getphoto()!) ==
                                          // "")
                                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                          // : LocalPreference.getphoto()!
                                          ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Text(
                              name,
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
                              email,
                              // "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: (isPortrait)
                        ? MediaQuery.sizeOf(context).height / 1.5
                        : MediaQuery.sizeOf(context).height / 2.2,
                    child: ListView(
                      children: [
                        Menutile(
                          name: "My Cart",
                          icon: Icons.shopping_cart,
                          action: () {},
                        ),
                        Menutile(
                          name: "Tables",
                          icon: Icons.table_bar,
                          action: () {},
                        ),
                        Menutile(
                          name: "Sofas",
                          icon: IconData(0xe242, fontFamily: 'MaterialIcons'),
                          action: () {},
                        ),
                        Menutile(
                          name: "Chairs",
                          icon: Icons.chair,
                          action: () {},
                        ),
                        Menutile(
                          name: "Cupboards",
                          icon: IconData(0xe35e, fontFamily: 'MaterialIcons'),
                          action: () {},
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
                          action: () {},
                        ),
                        Consumer(
                          builder: (context, ref, child) => Menutile(
                            name: "Logout",
                            icon: Icons.logout,
                            action: () async {
                              LocalPreference.setToken("");
                              LocalPreference.setphoto("");
                              LocalPreference.setname("");
                              LocalPreference.setmail("");
                              ref.watch(dashboardpro).isCollapsed = true;
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutePaths.login,
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
