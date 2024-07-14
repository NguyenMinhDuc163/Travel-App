import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes/router_names.dart';
import '../../models/hotel_model.dart';
import '../../models/room_model.dart';
import '../../view/auth/forgot_password_screen.dart';
import '../../view/auth/login_screen.dart';
import '../../view/auth/sign_up_screen.dart';
import '../../view/auth/splash_screen.dart';
import '../../view/booking/guest_and_room_booking_screen.dart';
import '../../view/booking/hotel_booking_screen.dart';
import '../../view/booking/hotel_detail_screen.dart';
import '../../view/booking/hotel_invoice_screen.dart';
import '../../view/booking/hotels_screen.dart';
import '../../view/booking/select_date_screen.dart';
import '../../view/booking/select_room_screen.dart';
import '../../view/flights/ticket_stub_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/intro_screen.dart';
import '../../view/payment/add_card_screen.dart';
import '../../view/flights/airplane_seats_choosee_screen.dart';
import '../../view/flights/booking_flight_screen.dart';
import '../../view/payment/promo_code_screen.dart';
import '../../view/profile/change_password_screen.dart';
import '../../view/booking/check_out_screen.dart';
import '../../view/flights/flight_detel_screen.dart';
import '../../view/main_app.dart';
import '../../view/payment/payment_method_screen.dart';
import '../../view/payment/payment_screen.dart';
import '../../view/profile/contact_details_screen.dart';
import '../../view/profile/profile_screen.dart';
import '../../view/profile/user_profile_sceen.dart';
import '../../view/search_and_ratings/ratiing_screen.dart';
import '../../view/search_and_ratings/search_screen.dart';


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
