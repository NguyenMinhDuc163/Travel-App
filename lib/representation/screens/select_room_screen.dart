import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../data/models/room_model.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/item_room_booking_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});
  static const String routeName = '/rooms_screen';
  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Select Room",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemRoomBookingwidge(
              roomImage: AssetHelper.icoHotelPlane,
              roomName: 'Deluxe Room',
              roomPrice: '245\$',
              roomUtility: 'Free Cancellation',
              roomSize: 27,
            ),

            ItemRoomBookingwidge(
              roomImage: AssetHelper.room2,
              roomName: 'Executive Suite',
              roomSize: 32,
              roomUtility: 'Non-refundable',
              roomPrice: '289\$',
            ),
            ItemRoomBookingwidge(
              roomImage: AssetHelper.room3,
              roomName: 'King Bed Only Room',
              roomSize: 24,
              roomUtility: 'Non-refundable',
              roomPrice: '\$',
            ),
          ],
        ),
      ),
    );
  }
}
