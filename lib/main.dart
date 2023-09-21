import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/view/loginpage/loginpage.dart';
import 'core/Navigation/app_rounters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalPreference.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: "NeoSTORE",
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
