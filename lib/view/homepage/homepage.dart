import 'package:flutter/material.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/view/homepage/widget/menu_tile.dart';
import 'package:neostore/view/homepage/widget/menudashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
          scale: _menuScaleAnimation,
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

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.7 * screenWidth,
        right: isCollapsed ? 0 : -0.5 * screenWidth,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
                animationDuration: duration,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                elevation: 8,
                color: backgroundColor,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    child: Container(
                      decoration: BoxDecoration(color: colorPrimaryText),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBar(
                              centerTitle: true,
                              backgroundColor: colorPrimary,
                              shadowColor: Colors.transparent,
                              title: const Text("NeoSTORE"),
                              leading: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  setState(() {
                                    if (isCollapsed)
                                      _controller.forward();
                                    else
                                      _controller.reverse();

                                    isCollapsed = !isCollapsed;
                                  });
                                },
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search_rounded))
                              ],
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
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setString("Token", "");
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushNamed(
                                              context, RoutePaths.login);
                                        },
                                        child: Text("Logout"))),
                              ],
                            ),
                          ]),
                    )))));
  }

//   @override
//   Widget build(BuildContext context) {
  // return Scaffold(
  //   backgroundColor: colorPrimary,
  // appBar: AppBar(
  //   centerTitle: true,
  //   backgroundColor: colorPrimary,
  //   shadowColor: Colors.transparent,
  //   title: const Text("NeoSTORE"),
  //   leading: IconButton(
  //     icon: Icon(Icons.menu),
  //     onPressed: () {
  //       // showDialog(
  //       //   context: context,
  //       //   builder: (context) => MenuDashboardPage(),
  //       // );
  //     },
  //   ),
  //   actions: [
  //     IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
  //   ],
  // ),
  // body: Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Center(
  //         child: ElevatedButton(
  //             onPressed: () {
  //               gettoken();
  //             },
  //             child: Text("Check Token"))),
  //     Center(
  //         child: ElevatedButton(
  //             onPressed: () async {
  //               SharedPreferences prefs =
  //                   await SharedPreferences.getInstance();
  //               prefs.setString("Token", "");
  //               // ignore: use_build_context_synchronously
  //               Navigator.pushNamed(context, RoutePaths.login);
  //             },
  //             child: Text("Logout"))),
  //   ],
  // ),
  // );
//   }
}

gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString("Token"));
}
