import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/extentions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  HotelBookingScreen({super.key});
  static const String routeName = '/hotel_booking';
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Hotel Booking",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kMediumPadding,),
            ItemBookingWidget(icon: AssetHelper.icoLocation, title: "Discription", description: "South Korea", onTap: (){},),

            SizedBox(height: kMediumPadding,),
            StatefulBuilder(builder: (context, setState){ // no chi render lai chill cua state nay
              return ItemBookingWidget(icon: AssetHelper.icoLocation, title: "Select Date",
                  description: dateSelected ?? '13 Feb - 18 Feb 2024', onTap: () async{
                      final resul = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                      if(!(resul as List<DateTime?>).any((element) => element == null)){
                         dateSelected = '${resul[0]?.getStartDate} - ${resul[1]?.getEndDate}';
                         setState((){

                         });
                      }
                  });
            }),

            SizedBox(height: kMediumPadding,),
            ItemBookingWidget(icon: AssetHelper.icoLocation, title: "Guest and Room", description: "2 Guest, 1 Room", onTap: (){}),

            SizedBox(height: kMediumPadding,),
            ButtonWidget(title: "Search", ontap: (){},)
          ],
        ),
      ),
    );
  }
}
