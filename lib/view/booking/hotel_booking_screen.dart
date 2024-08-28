import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';
import '../../res/core/constants/dimension_constants.dart';
import '../../res/core/helpers/asset_helper.dart';
import '../../res/widget/app_bar_container.dart';
import '../../res/widget/buttom_widget.dart';
import '../../res/widget/item_booking_widget.dart';
import '../../utils/routes/router_names.dart';
import 'hotels_screen.dart';
import 'select_date_screen.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.nameDestination});
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
        child: Consumer<HotelBookingViewModel>(
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
                            .pushNamed(RouteNames.selectDateScreen);
                        if (!(resul as List<DateTime?>)
                            .any((element) => element == null)) {

                          setState(() {
                            // dateSelected = '${resul[0]?.getStartDate} - ${resul[1]?.getEndDate}';
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
                          .pushNamed(RouteNames.guestAndRoomBookingScreen);
                    }),
                SizedBox(
                  height: kMediumPadding,
                ),
                ButtonWidget(
                  title: "Search",
                  ontap: () {
                    Navigator.of(context).pushNamed(RouteNames.hotelsScreen);
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
