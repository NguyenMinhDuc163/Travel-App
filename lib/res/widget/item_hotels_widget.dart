import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';
import '../../models/hotel_model.dart';
import '../../utils/routes/router_names.dart';
import '../../view/booking/hotel_detail_screen.dart';
import '../core/constants/color_constants.dart';
import '../core/constants/dimension_constants.dart';
import '../core/helpers/asset_helper.dart';
import '../core/helpers/image_helper.dart';
import 'buttom_widget.dart';
import 'dashline_widge.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocationBlank),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.location),
                    Expanded(
                      child: Text(
                        ' - ${hotelModel.awayKilometer} for destination',
                        style: TextStyle(color: ColorPalette.subTitleColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoStar),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.star.toString()),
                    Text(
                      ' - ${hotelModel.numberOfReview} reviews',
                      style: TextStyle(color: ColorPalette.subTitleColor),
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Text('/night'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: "Book a room",
                        ontap: () {
                          Provider.of<HotelBookingViewModel>(context, listen: false)
                              .setHotelModel(hotelModel);

                          Navigator.of(context).pushNamed(
                              RouteNames.hotelDetailScreen,
                              arguments: hotelModel);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
