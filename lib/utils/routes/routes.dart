import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/view/hotel_booking_screen.dart';
import 'package:travel_app/view/sign_up_screen.dart';
import '../../models/hotel_model.dart';
import '../../models/room_model.dart';
import '../../view/add_card_screen.dart';
import '../../view/airplane_seats_choosee_screen.dart';
import '../../view/booking_flight_screen.dart';
import '../../view/change_password_screen.dart';
import '../../view/check_out_screen.dart';
import '../../view/contact_details_screen.dart';
import '../../view/flight_detel_screen.dart';
import '../../view/forgot_password_screen.dart';
import '../../view/guest_and_room_booking_screen.dart';
import '../../view/home_screen.dart';
import '../../view/hotel_detail_screen.dart';
import '../../view/hotel_invoice_screen.dart';
import '../../view/hotels_screen.dart';
import '../../view/intro_screen.dart';
import '../../view/login_screen.dart';
import '../../view/main_app.dart';
import '../../view/payment_method_screen.dart';
import '../../view/payment_screen.dart';
import '../../view/profile_screen.dart';
import '../../view/promo_code_screen.dart';
import '../../view/ratiing_screen.dart';
import '../../view/search_screen.dart';
import '../../view/select_date_screen.dart';
import '../../view/select_room_screen.dart';
import '../../view/splash_screen.dart';
import '../../view/ticket_stub_screen.dart';
import '../../view/user_profile_sceen.dart';


final Map<String, WidgetBuilder> routes = {
  // noi tong hop ca routes
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) => GuestAndRoomBookingScreen(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  RattingScreen.routeName: (context) => RattingScreen(),
  BookingFlightScreen.routeName: (context) => BookingFlightScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  UserProfileScreen.routeName: (context) => UserProfileScreen(),
  ContactDetailsScreen.routeName: (context) => ContactDetailsScreen(),
  PromoCodeScreen.routeName: (context) => PromoCodeScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  TicketStubScreen.routeName: (context) => TicketStubScreen(),
  PaymentMethodScreen.routeName: (context) => PaymentMethodScreen(),
  AddCardScreen.routeName: (context) => AddCardScreen(),
  FlightDetailScreen.routeName: (context) => FlightDetailScreen(),
  AirplaneSeatsChooseScreen.routeName: (context) => AirplaneSeatsChooseScreen(),
  HotelInvoiceScreen.routeName: (context) => HotelInvoiceScreen(),
  ChangePassWordScreen.routeName: (context) => ChangePassWordScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),


};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );

    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      return MaterialPageRoute<dynamic>(builder: (context) {
        final String? nameDestination = (settings.arguments as String?);
        return HotelBookingScreen(
          nameDestination: nameDestination,
        );
      });
  }
}
