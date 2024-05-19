import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/ticket_stub_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../core/constants/dimension_constants.dart';
import '../widgets/buttom_widget.dart';

class AirplaneSeatsChooseScreen extends StatefulWidget {
  const AirplaneSeatsChooseScreen({super.key});
  static const String routeName = '/airplane_seats_choose_screen';

  @override
  State<AirplaneSeatsChooseScreen> createState() =>
      _AirplaneSeatsChooseScreenState();
}

class _AirplaneSeatsChooseScreenState extends State<AirplaneSeatsChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
        titleString: "Airplane Seats Choose",
        positon: true,
        child: Stack(
          children: [
            Positioned(
                top: 220,
                left: 30,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 110,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A1',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Economy class', style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Price: \$100',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )

            ),

            Positioned(
                top: 450,
                left: 25,
                child: Column(
              children: [
                Text("Ha Noi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Icon(Icons.flight_takeoff, size: 30,),
                Text("Ho Chi Minh", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            )),
            Positioned(
                right: -40,
                bottom: 0,
                top: 80,
                child: Image.asset(AssetHelper.airplaneSeats)),
            Positioned(
                bottom: 0,
                left: kDefaultPadding,
                right: kDefaultPadding,
                child: Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: ButtonWidget(
                title: 'Add Seat',
                ontap: () {
                  Navigator.of(context).pushNamed(TicketStubScreen.routeName);
                },
              ),
            ))
          ],
        ));
  }
}
