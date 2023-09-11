import 'package:flutter/material.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/view/dashboard/widget/menu_sidebar.dart';
import 'package:neostore/view/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
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
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
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
          Menu(
              slideAnimation: _slideAnimation,
              menuScaleAnimation: _menuScaleAnimation),
          // homepage(context)
          dashboard(context)
          // AnimatedPositioned(
          //   duration: duration,
          //   top: 0,
          //   bottom: 0,
          //   left: isCollapsed ? 0 : 10,
          //   right: isCollapsed ? 0 : -10,
          //   child: ScaleTransition(
          //     scale: _scaleAnimation,
          //     child: Material(
          //       animationDuration: duration,
          //       borderRadius: const BorderRadius.all(Radius.circular(40)),
          //       elevation: 10,
          //       color: backgroundColor,
          //       child: HomePage(
          //         context: context,
          //         controller: _controller,
          //         isCollapsed: isCollapsed,
          //         scaleAnimation: _scaleAnimation,
          //         screenWidth: MediaQuery.sizeOf(context).width,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget homepage(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 10,
      right: isCollapsed ? 0 : -10,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 10,
          color: backgroundColor,
          child: HomePage(
            context: context,
            controller: _controller,
            isCollapsed: isCollapsed,
            scaleAnimation: _scaleAnimation,
            screenWidth: MediaQuery.sizeOf(context).width,
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
                animationDuration: duration,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                elevation: 10,
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
                                icon: (isCollapsed)
                                    ? const Icon(Icons.menu)
                                    : const Icon(
                                        Icons.arrow_back_ios_new_sharp),
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
}

gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString("Token"));
}
