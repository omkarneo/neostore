import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/loginpage/loginpage.dart';
import 'core/Navigation/app_rounters.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
