import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../data/models/room_model.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/item_room_booking_widget.dart';
import 'check_out_screen.dart';

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
            ...listRoom.map((e) => Padding(
              padding: EdgeInsets.only(bottom: kMediumPadding),
              child: ItemRoomBookingwidge( // dua thang cai list ra
                    roomImage: e.roomImage,
                    roomName: e.roomName,
                    roomPrice: e.price,
                    roomUtility: e.utility,
                    roomSize: e.size,
                    onTap: () {
                      Navigator.of(context).pushNamed(CheckOutScreen.routeName, arguments: e);
                    }, numberOfRoom: null,
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
