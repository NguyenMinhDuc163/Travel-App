import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/ticket_stub_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import 'airplane_seats_choosee_screen.dart';

class FlightDetailScreen extends StatefulWidget {
  const FlightDetailScreen({super.key});
  static const String routeName = '/flight_detail_screen';
  @override
  State<FlightDetailScreen> createState() => _FlightDetailScreenState();
}


Widget _buildBlockTicket(String icon, String title, String subTitle, String time, String description, {Function()? onTap}){
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
              child: Image.asset(icon, width: 80, height: 80,),),
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
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(subTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _buildBlockTicket(AssetHelper.bamboLogo, "JKT", "Jakarta", "10:00", "Round trip flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
            _buildBlockTicket(AssetHelper.jalLogo, "Viet Nam", "japan", "16:00", "One-way flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
            _buildBlockTicket(AssetHelper.jetstarLogo, "VietNam", "New York", "1:00", "Round trip flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
            _buildBlockTicket(AssetHelper.vietjetLogo, "Ha Noi", "Ho Chi Minh city", "10:00", "One-way flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
            _buildBlockTicket(AssetHelper.vietnamAirlineLogo, "Ha Noi", "Da Nang", "10:00", "Round trip flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
            _buildBlockTicket(AssetHelper.jalLogo, "Viet Nam", "japan", "16:00", "One-way flight", onTap: (){
              Navigator.pushNamed(context, AirplaneSeatsChooseScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
