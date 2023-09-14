import 'package:flutter/cupertino.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/productpage/productpage.dart';
import 'package:neostore/view/registerpage/registerpage.dart';
import '../../view/dashboard/dashboard.dart';
import '../../view/loginpage/loginpage.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // -------------- sub Routes ----------------
      case RoutePaths.login:
        return CupertinoPageRoute(
          builder: (context) => const LoginPage(),
          settings: const RouteSettings(name: RoutePaths.login),
        );

      case RoutePaths.dashboard:
        return CupertinoPageRoute(
          builder: (context) => const Dashboard(),
          settings: const RouteSettings(name: RoutePaths.dashboard),
        );

      case RoutePaths.registerpage:
        return CupertinoPageRoute(
          builder: (context) => const RegisterPage(),
          settings: const RouteSettings(name: RoutePaths.registerpage),
        );
      case RoutePaths.productlist:
        return CupertinoPageRoute(
          builder: (context) => ProductPage(
            id: settings.arguments,
          ),
          settings: RouteSettings(
              name: RoutePaths.productlist, arguments: settings.arguments),
        );

      // -------------- Default Route -------------
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
