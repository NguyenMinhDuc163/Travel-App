import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';
import '../res/core/constants/color_constants.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
import '../res/widget/item_add_guest_and_room.dart';

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
    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppBarContinerWidget(
        titleString: "Guest and Room",
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 1.5,
            ),
            ItemAddGuestAndRoom(
              title: 'Guest',
              icon: AssetHelper.icoGuest,
              initDate: 2,
              onValueChanged: (int value) {
                Provider.of<HotelBookingViewModel>(context, listen: false)
                    .setGuest(value);
              },

            ),

            ItemAddGuestAndRoom(
              title: 'Room',
              icon: AssetHelper.icoBed,
              initDate: 1,
              onValueChanged: (int value) {
                Provider.of<HotelBookingViewModel>(context, listen: false)
                    .setRoom(value);
              },
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
              opacity: ColorPalette.primaryColor.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}
