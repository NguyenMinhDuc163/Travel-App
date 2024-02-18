import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/widgets/item_utility_widge.dart';

import 'buttom_widget.dart';

class ItemRoomBookingwidge extends StatelessWidget {
  const ItemRoomBookingwidge(
      {super.key,
      required this.roomImage,
      required this.roomName,
      required this.roomPrice,
      required this.roomUtility,
      required this.roomSize});
  final String roomImage;
  final String roomName;
  final String roomPrice;
  final String roomUtility;
  final int roomSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(roomName),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text('Room sized: $roomSize m2'),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text(roomUtility),
                ],
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              ImageHelper.loadFromAsset(roomImage, radius: BorderRadius.all(Radius.circular(kMinPadding)))
            ],
          ),
          ItemUtilityWidge(),
          SizedBox(
            height: kDefaultPadding * 1.5,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomPrice}',
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

                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
