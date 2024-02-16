import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';
import 'package:travel_app/routes.dart';

void main() async{
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper(); // khoi tao LocalStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travo App",
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      home: const SplashScreen(),
      routes: routes, // biet routes nam o dau
      debugShowCheckedModeBanner: false,
    );
  }
}

