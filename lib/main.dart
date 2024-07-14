import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/res/core/constants/color_constants.dart';
import 'package:travel_app/res/core/helpers/local_storage_helper.dart';
import 'package:travel_app/utils/routes/routes.dart';
import 'package:travel_app/view/splash_screen.dart';
import 'package:travel_app/viewModel/user_viewmodel.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBGcaswmyTpDHEglKPas9fxr5ZJahkwp7s",
          appId: "1:183380913156:android:64773a459efaf87eda1951",
          messagingSenderId: "183380913156",
          projectId: "travolapp"));

  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper(); // khoi tao LocalStorage
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => HotelBookingViewModel()),

  ],
    child: const MyApp(),
  ));
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
      onGenerateRoute: generateRoutes,
    );
  }
}
