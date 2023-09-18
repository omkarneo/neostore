import 'package:flutter/cupertino.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/cartpage/cartpage.dart';
import 'package:neostore/view/orderpage/orderpage.dart';
import 'package:neostore/view/productlistpage/productlistpage.dart';
import 'package:neostore/view/registerpage/registerpage.dart';
import '../../view/dashboard/dashboard.dart';
import '../../view/loginpage/loginpage.dart';
import '../../view/productdetailed/productdetailedpage.dart';

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

      case RoutePaths.cartpage:
        return CupertinoPageRoute(
          builder: (context) => const CartPage(),
          settings: const RouteSettings(name: RoutePaths.cartpage),
        );

      case RoutePaths.productlist:
        return CupertinoPageRoute(
          builder: (context) => ProductPage(
            id: settings.arguments,
          ),
          settings: RouteSettings(
              name: RoutePaths.productlist, arguments: settings.arguments),
        );

      case RoutePaths.productdetailed:
        return CupertinoPageRoute(
          builder: (context) => ProductDetailed(
            data: settings.arguments,
          ),
          settings: RouteSettings(
              name: RoutePaths.productdetailed, arguments: settings.arguments),
        );

      case RoutePaths.orderpage:
        return CupertinoPageRoute(
          builder: (context) => const OrderPage(),
          settings: const RouteSettings(name: RoutePaths.productdetailed),
        );

      // -------------- Default Route -------------
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
