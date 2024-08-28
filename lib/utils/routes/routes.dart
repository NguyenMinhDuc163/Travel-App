
import 'package:flutter/material.dart';
import 'package:travel_app/init.dart';
import 'router_names.dart';

final Map<String, WidgetBuilder> routes = {
  // noi tong hop ca routes
  RouteNames.addCardScreen: (context) => AddCardScreen(),
  RouteNames.airplaneSeatsChooseScreen: (context) => AirplaneSeatsChooseScreen(),
  RouteNames.bookingFlightScreen: (context) => BookingFlightScreen(),
  RouteNames.changePasswordScreen: (context) => ChangePassWordScreen(),
  RouteNames.contactDetailsScreen: (context) => ContactDetailsScreen(),
  RouteNames.flightDetailScreen: (context) => FlightDetailScreen(),
  RouteNames.forgotPasswordScreen: (context) => ForgotPasswordScreen(),
  RouteNames.guestAndRoomBookingScreen: (context) => GuestAndRoomBookingScreen(),
  RouteNames.homeScreen: (context) => HomeScreen(),
  RouteNames.hotelInvoiceScreen: (context) => HotelInvoiceScreen(),
  RouteNames.hotelsScreen: (context) => HotelsScreen(),
  RouteNames.introScreen: (context) => IntroScreen(),
  RouteNames.loginScreen: (context) => LoginScreen(),
  RouteNames.mainApp: (context) => MainApp(),
  RouteNames.paymentMethodScreen: (context) => PaymentMethodScreen(),
  RouteNames.paymentScreen: (context) => PaymentScreen(),
  RouteNames.profileScreen: (context) => ProfileScreen(),
  RouteNames.promoCodeScreen: (context) => PromoCodeScreen(),
  RouteNames.rattingScreen: (context) => RattingScreen(),
  RouteNames.searchScreen: (context) => SearchScreen(),
  RouteNames.selectDateScreen: (context) => SelectDateScreen(),
  RouteNames.selectRoomScreen: (context) => SelectRoomScreen(),
  RouteNames.signUpScreen: (context) => SignUpScreen(),
  RouteNames.splashScreen: (context) => SplashScreen(),
  RouteNames.ticketStubScreen: (context) => TicketStubScreen(),
  RouteNames.userProfileScreen: (context) => UserProfileScreen(),



};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.hotelDetailScreen:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );

    case RouteNames.checkOutScreen:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case RouteNames.hotelBookingScreen:
      return MaterialPageRoute<dynamic>(builder: (context) {
        final String? nameDestination = (settings.arguments as String?);
        return HotelBookingScreen(
          nameDestination: nameDestination,
        );
      });
  }
}
