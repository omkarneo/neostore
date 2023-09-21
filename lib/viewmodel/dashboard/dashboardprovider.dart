import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardpro = ChangeNotifierProvider((ref) => DashboardPro());

class DashboardPro extends ChangeNotifier {
  bool isCollapsed = true;

  void collapsed(controller) {
    if (isCollapsed) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isCollapsed = !isCollapsed;
    notifyListeners();
  }
}
