import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/provider/hotel_booking_provider.dart';
import 'package:travel_app/representation/screens/ticket_stub_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../data/models/flight_model.dart';
import 'airplane_seats_choosee_screen.dart';

class FlightDetailScreen extends StatefulWidget {
  const FlightDetailScreen({super.key});
  static const String routeName = '/flight_detail_screen';
  @override
  State<FlightDetailScreen> createState() => _FlightDetailScreenState();
}
List<Flight> flights = [
  Flight(
    airlineLogo: AssetHelper.bamboLogo,
    from: "JKT",
    to: "Jakarta",
    departureTime: "10:00",
    flightType: "Round trip flight",
  ),
  Flight(
    airlineLogo: AssetHelper.jalLogo,
    from: "Viet Nam",
    to: "Japan",
    departureTime: "16:00",
    flightType: "One-way flight",
  ),
  Flight(
    airlineLogo: AssetHelper.jetstarLogo,
    from: "VietNam",
    to: "New York",
    departureTime: "1:00",
    flightType: "Round trip flight",
  ),
  Flight(
    airlineLogo: AssetHelper.vietjetLogo,
    from: "Ha Noi",
    to: "Ho Chi Minh city",
    departureTime: "10:00",
    flightType: "One-way flight",
  ),
  Flight(
    airlineLogo: AssetHelper.vietnamAirlineLogo,
    from: "Ha Noi",
    to: "Da Nang",
    departureTime: "10:00",
    flightType: "Round trip flight",
  ),
  Flight(
    airlineLogo: AssetHelper.jalLogo,
    from: "Viet Nam",
    to: "Japan",
    departureTime: "16:00",
    flightType: "One-way flight",
  ),
];


Widget _buildBlockTicket(Flight flight, {Function()? onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image.asset(flight.airlineLogo, width: 80, height: 80,),),
            // Line
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 1,
              height: 80,
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(flight.from, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(flight.to, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(flight.departureTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(flight.flightType, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
class _FlightDetailScreenState extends State<FlightDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Flight Detail",
      child: SingleChildScrollView(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              ...flights.map((flight) => _buildBlockTicket(flight,
              onTap: (){
                Provider.of<HotelBookingProvider>(context, listen: false).setFlight(flight);
                Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
              }
              )).toList(),
            ],
          ),
        ),
      ),



    );
  }
}
