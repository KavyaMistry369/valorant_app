import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/services/api_service.dart';
import 'package:valorant_app/utils/routes.dart';
import 'package:valorant_app/views/screens/detail_page.dart';
import 'package:valorant_app/views/screens/home_page.dart';
import 'package:valorant_app/views/screens/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  APIService.apiService.getData();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: CupertinoColors.destructiveRed,
      ),
      initialRoute: Routes.splashPage,
      routes: {
        '/': (context) => const SplashPage(),
        Routes.homePage: (context) => const HomePage(),
        Routes.detailPage: (context) => const DetailPage(),
      },
    );
  }
}
