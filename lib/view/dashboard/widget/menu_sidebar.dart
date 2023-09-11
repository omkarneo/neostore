import 'package:flutter/material.dart';

import 'menu_tile.dart';

class Menu extends StatefulWidget {
  final slideAnimation;
  final menuScaleAnimation;
  const Menu({super.key, this.slideAnimation, this.menuScaleAnimation});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.slideAnimation,
      child: ScaleTransition(
          scale: widget.menuScaleAnimation,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(children: [
                    ClipOval(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Omkar Parekh",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "omkarparekh@neosoft.com",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  child: ListView(
                    children: const [
                      Menutile(
                        name: "My Cart",
                        icon: Icons.shopping_cart,
                      ),
                      Menutile(
                        name: "Tables",
                        icon: Icons.table_bar,
                      ),
                      Menutile(
                        name: "Sofas",
                        icon: IconData(0xe242, fontFamily: 'MaterialIcons'),
                      ),
                      Menutile(
                        name: "Chairs",
                        icon: Icons.chair,
                      ),
                      Menutile(
                        name: "Cupboards",
                        icon: IconData(0xe35e, fontFamily: 'MaterialIcons'),
                      ),
                      Menutile(
                        name: "My Account",
                        icon: Icons.person,
                      ),
                      Menutile(
                        name: "Store Locator",
                        icon: Icons.location_on,
                      ),
                      Menutile(
                        name: "My Orders",
                        icon: Icons.paste,
                      ),
                      Menutile(
                        name: "Logout",
                        icon: Icons.logout,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
