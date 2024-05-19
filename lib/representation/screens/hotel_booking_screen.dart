import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/extentions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';

import '../../provider/hotel_booking_provider.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.nameDestination});
  static const String routeName = '/hotel_booking';
  final String? nameDestination;
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;

  String getFormattedDateRange() {
    // Lấy ngày tháng năm hiện tại
    DateTime now = DateTime.now();

    // Lấy ngày của tháng trước
    DateTime lastMonth = DateTime(now.year, now.month - 1, now.day);

    // Định dạng ngày tháng năm hiện tại
    String formattedDateNow = DateFormat('dd MMM').format(now);

    // Định dạng ngày của tháng trước
    String formattedDateLastMonth = DateFormat('dd MMM').format(lastMonth);

    // Kết hợp và trả về kết quả
    return '$formattedDateLastMonth - $formattedDateNow ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Hotel Booking",
      subTitleString: 'Choose your favorite hotel and enjoy the service',
      child: SingleChildScrollView(
        child: Consumer<HotelBookingProvider>(
          builder: (context, select, child) {
            return Column(
              children: [
                SizedBox(
                  height: kMediumPadding,
                ),
                ItemBookingWidget(
                  icon: AssetHelper.icoLocation,
                  title: "Discription",
                  description: widget.nameDestination ?? 'Discription',
                  onTap: () {},
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                StatefulBuilder(builder: (context, setState) {
                  // no chi render lai chill cua state nay
                  return ItemBookingWidget(
                      icon: AssetHelper.icoLocation,
                      title: "Select Date",
                      description: dateSelected ?? getFormattedDateRange(),
                      onTap: () async {
                        final resul = await Navigator.of(context)
                            .pushNamed(SelectDateScreen.routeName);
                        if (!(resul as List<DateTime?>)
                            .any((element) => element == null)) {

                          setState(() {
                            dateSelected = '${resul[0]?.getStartDate} - ${resul[1]?.getEndDate}';
                            select.setDate(resul[0]!, resul[1]!);
                          });
                        }
                      });
                }),
                SizedBox(
                  height: kMediumPadding,
                ),
                ItemBookingWidget(
                    icon: AssetHelper.icoLocation,
                    title: "Guest and Room",
                    description: "${select.guest ?? "2"} Guest, ${select.room ?? "1"} Room",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(GuestAndRoomBookingScreen.routeName);
                    }),
                SizedBox(
                  height: kMediumPadding,
                ),
                ButtonWidget(
                  title: "Search",
                  ontap: () {
                    Navigator.of(context).pushNamed(HotelsScreen.routeName);
                  },
                )
              ],
            );
          },
        )
      ),
    );
  }
}
