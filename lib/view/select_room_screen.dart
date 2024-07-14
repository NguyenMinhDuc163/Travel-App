import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';

import '../models/room_model.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/item_room_booking_widget.dart';
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
      roomName: 'Phòng Deluxe',
      size: 27,
      utility: 'Hủy miễn phí',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Phòng Suite Executive',
      size: 32,
      utility: 'Không hoàn tiền',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'Phòng Giường King',
      size: 24,
      utility: 'Không hoàn tiền',
      price: 214,
    ),
    RoomModel(
      roomImage: AssetHelper.room4,
      roomName: 'Phòng Superior',
      size: 30,
      utility: 'Hủy miễn phí',
      price: 260,
    ),
    RoomModel(
      roomImage: AssetHelper.room5,
      roomName: 'Phòng Standard',
      size: 22,
      utility: 'Không hoàn tiền',
      price: 200,
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
                      Provider.of<HotelBookingViewModel>(context, listen: false).setRoomModel(e);
                      print(Provider.of<HotelBookingViewModel>(context, listen: false).roomModel);

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
