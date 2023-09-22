import 'package:flutter/cupertino.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/editprofile/editprofile.dart';
import 'package:neostore/view/myaccount/myaccount.dart';
import 'package:neostore/view/address/addresspage.dart';
import 'package:neostore/view/cartpage/cartpage.dart';
import 'package:neostore/view/orderdetailedpage/orderdetailedpage.dart';
import 'package:neostore/view/orderpage/orderpage.dart';
import 'package:neostore/view/productlistpage/productlistpage.dart';
import 'package:neostore/view/registerpage/registerpage.dart';
import 'package:neostore/view/storelocatorpage/storelocatorpage.dart';
import '../../view/addressadd/addressaddpage.dart';
import '../../view/dashboard/dashboard.dart';
import '../../view/loginpage/loginpage.dart';
import '../../view/productdetailed/productdetailedpage.dart';
import '../../view/resetpassword/resetpassword.dart';

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
          settings: const RouteSettings(name: RoutePaths.orderpage),
        );
      case RoutePaths.orderdetailedpage:
        return CupertinoPageRoute(
          builder: (context) => OrderDetailedPage(
            id: settings.arguments,
          ),
          settings: RouteSettings(
              name: RoutePaths.orderdetailedpage,
              arguments: settings.arguments),
        );
      case RoutePaths.addresspage:
        return CupertinoPageRoute(
          builder: (context) => const AddressPage(),
          settings: const RouteSettings(name: RoutePaths.addresspage),
        );
      case RoutePaths.addressaddpage:
        return CupertinoPageRoute(
          builder: (context) => const AddressAddPage(),
          settings: const RouteSettings(name: RoutePaths.addressaddpage),
        );
      case RoutePaths.storelocatorpage:
        return CupertinoPageRoute(
          builder: (context) => const StoreLocator(),
          settings: const RouteSettings(name: RoutePaths.storelocatorpage),
        );
      case RoutePaths.accountpage:
        return CupertinoPageRoute(
          builder: (context) => const AccountPage(),
          settings: const RouteSettings(name: RoutePaths.accountpage),
        );
      case RoutePaths.editaccountpage:
        return CupertinoPageRoute(
          builder: (context) => EditProfile(
            userdata: settings.arguments,
          ),
          settings: RouteSettings(
              name: RoutePaths.editaccountpage, arguments: settings.arguments),
        );
      case RoutePaths.resetpasswordpage:
        return CupertinoPageRoute(
          builder: (context) => const ResetPasswordPage(),
          settings: const RouteSettings(name: RoutePaths.resetpasswordpage),
        );

      // -------------- Default Route -------------
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
