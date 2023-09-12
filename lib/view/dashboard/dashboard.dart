import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/view/dashboard/widget/menu_sidebar.dart';
import 'package:neostore/view/homepage/homepage.dart';

import '../../viewmodel/dashboard/dashboardprovider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
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
            menuScaleAnimation: _menuScaleAnimation,
          ),
          dashboard(context)
        ],
      ),
    );
  }

  Widget dashboard(context) {
    return Consumer(builder: (context, ref, child) {
      var iscollaped = ref.watch(dashboardpro).isCollapsed;
      return AnimatedPositioned(
          duration: duration,
          top: 0,
          bottom: 0,
          left: iscollaped ? 0 : 0.6 * screenWidth,
          right: iscollaped ? 0 : -0.2 * screenWidth,
          child: ScaleTransition(
              scale: _scaleAnimation,
              child: HomePage(
                controller: _controller,
              )));
    });
  }
}
