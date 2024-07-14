import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';

import '../core/constants/dimension_constants.dart';
import '../core/helpers/asset_helper.dart';
import 'dashline_widge.dart';

class InvoidWidget extends StatefulWidget {
  const InvoidWidget({super.key, required this.airline, required this.passenger, required this.logo, this.checkInvoice});
  final String airline;
  final String passenger;
  final String logo;
  final bool? checkInvoice;
  @override
  State<InvoidWidget> createState() => _InvoidWidgetState();
}

class _InvoidWidgetState extends State<InvoidWidget> {


  Widget columCustom(String top, String bottom){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(top, style: TextStyle(fontSize: 15),),
        Text(bottom, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        color: Colors.grey.shade50,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    child: Image.asset(widget.logo, width: 60, height: 60,) ),
              ),
              SizedBox(width: kDefaultPadding,),
              Expanded(child: columCustom(widget.checkInvoice  != null ? "Hotel" : "Airline", widget.airline), flex: 2,),
              Expanded(child: columCustom("Passengers", widget.passenger), flex: 2,),
            ],
          ),

          SizedBox(height: kDefaultPadding,),
          widget.checkInvoice != null?
              Consumer<HotelBookingViewModel>(
                builder: (context, data, _){
                  return Row(
                    children: [
                      Expanded(flex: 2,child: columCustom("Check-in", data.dateStart.toString()),),
                      Expanded(child: columCustom("Room", data.room.toString()),),
                      Expanded(child: columCustom("Guest", data.guest.toString())),
                    ],
                  );
                },
              )
              :
          Row(
            children: [
              Expanded(child: columCustom("Date", "24 Mar 2020"), flex: 2,),
              Expanded(child: columCustom("Gate", "24A"),),
              Expanded(child: columCustom("Flight No.", "NNS24"),),
            ],
          ),
          SizedBox(height: kDefaultPadding,),
          Row(
            children: [
              Expanded(child: columCustom("Boarding Time", "02:39pm"), flex: 2,),
              Expanded(child: columCustom("Seat", "5A"),),
              Expanded(child: columCustom("Class", "Economy"),),
            ],
          ),
          DashLineWidget(color: Colors.black45,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetHelper.barCode),
              Image.asset(AssetHelper.barCode),
              Image.asset(AssetHelper.barCode),
            ],
          )
          , Text('1234 5678 90AS 6543 21CV'),
        ],
      ),
    );
  }
}
