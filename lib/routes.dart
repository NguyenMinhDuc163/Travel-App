import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/representation/screens/check_out_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

import 'data/models/hotel_model.dart';

final Map<String, WidgetBuilder> routes = { // noi tong hop ca routes
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => HotelBookingScreen(),
  SelectDateScreen.routeName: (context) =>  SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) =>  GuestAndRoomBookingScreen(),
  HotelsScreen.routeName: (context) =>  HotelsScreen(),
  SelectRoomScreen.routeName: (context) =>  SelectRoomScreen(),
  CheckOutScreen.routeName: (context) =>  CheckOutScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) =>
            HotelDetailScreen(
              hotelModel: hotelModel,
            ),
      );
  }
}