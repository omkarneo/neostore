import 'package:flutter/cupertino.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import '../../view/homepage/homepage.dart';
import '../../view/loginpage/loginpage.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // -------------- sub Routes ----------------
      // -------------- LoginPage Route ------------
      case RoutePaths.login:
        return CupertinoPageRoute(
          builder: (context) => const LoginPage(),
          settings: const RouteSettings(name: RoutePaths.login),
        );

      case RoutePaths.homepage:
        return CupertinoPageRoute(
          builder: (context) => const HomePage(),
          settings: const RouteSettings(name: RoutePaths.homepage),
        );

      // -------------- Default Route -------------
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
