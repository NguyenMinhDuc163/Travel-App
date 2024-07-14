import 'package:flutter/material.dart';

import '../res/core/constants/dimension_constants.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/flight_widget.dart';
import '../res/widget/rounded_button_widget.dart';

class BookingFlightScreen extends StatefulWidget {
  const BookingFlightScreen({super.key});
  static const String routeName = '/booking_flight_screen';
  @override
  State<BookingFlightScreen> createState() => _BookingFlightScreenState();
}

class _BookingFlightScreenState extends State<BookingFlightScreen> {

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    FlightWidget(type: 1, to: 'Surabaya', from: 'Jakarta', departure: '25/02/2024', passengers: 1, classFlight: 'Economy'),
    FlightWidget(type: 2, to: 'Viet Nam', from: 'Japan', departure: '26/02/2024', passengers: 5, classFlight: 'Economy', returnFlight: '16/03/2024',),
    FlightWidget(type: 3, to: 'China', from: 'Viet Nam', departure: '28/02/2024', passengers: 3, classFlight: 'Economy', numFlight: 3,),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Book your flight',
      child:  Column(
        children: <Widget>[
          SizedBox(height: kDefaultPadding * 3,),
          Container(
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  icon: Icons.home,
                  onPressed: () => _onItemTapped(0),
                  isSelected: _selectedIndex == 0,
                ),
                RoundedButton(
                  icon: Icons.business,
                  onPressed: () => _onItemTapped(1),
                  isSelected: _selectedIndex == 1,
                ),
                RoundedButton(
                  icon: Icons.school,
                  onPressed: () => _onItemTapped(2),
                  isSelected: _selectedIndex == 2,
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding,),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
