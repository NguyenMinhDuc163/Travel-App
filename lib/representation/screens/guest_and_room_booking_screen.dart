import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../widgets/buttom_widget.dart';
import '../widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});
  static const String routeName = '/guest_and_room_screen';
  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "add Guest and Room",
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemAddGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.icoGuest,
            initDate: 2,
          ),

          ItemAddGuestAndRoom(
            title: 'Room',
            icon: AssetHelper.icoBed,
            initDate: 1,
          ),

          ButtonWidget(
            title: "Search",
            ontap: (){
              Navigator.of(context).pop(); // se tra 1 list ve man booking
            },
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
            title: "Cancel",
            ontap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
