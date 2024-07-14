import 'package:flutter/material.dart';

import '../core/constants/dimension_constants.dart';
import '../core/helpers/asset_helper.dart';
import 'info_fight_widget.dart';
class FlightWidget extends StatelessWidget {
  const FlightWidget({super.key, required this.type, this.numFlight, required this.to, required this.from, required this.departure, this.returnFlight, required this.passengers, required this.classFlight});
  final int type;
  final int? numFlight;
  final String to;
  final String from;
  final String departure;
  final String? returnFlight;
  final int  passengers;
  final String classFlight;

  Widget _buildIInformation(index){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Flight $index', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        SizedBox(height: kDefaultPadding,),

        InfoFlightWidget(
            icon: AssetHelper.icoAir, textUp: 'From', textDown: from),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
            child: InfoFlightWidget(
                icon: AssetHelper.icoLocalFlight,
                textUp: 'To',
                textDown: to)),
        SizedBox(
          height: kDefaultPadding,
        ),
        InfoFlightWidget(
            icon: AssetHelper.icoCalender,
            textUp: 'Departure',
            textDown: departure),
        if(type == 2)SizedBox(
          height: kDefaultPadding,
        ),
        if(type == 2) InfoFlightWidget(
            icon: AssetHelper.icoCalender,
            textUp: 'Return',
            textDown: returnFlight ?? 'not date'),
        SizedBox(
          height: kDefaultPadding,
        ),
        InfoFlightWidget(
            icon: AssetHelper.icoPersonFlight,
            textUp: 'Passengers',
            textDown: '$passengers Passenger'),
        SizedBox(
          height: kDefaultPadding,
        ),
        InfoFlightWidget(
            icon: AssetHelper.icoClassFlight,
            textUp: 'Class',
            textDown: classFlight),
        SizedBox(
          height: kDefaultPadding,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numFlight ?? 1,
      itemBuilder: (BuildContext context, int index){
        return _buildIInformation(index + 1);
      },
    );
  }
}
