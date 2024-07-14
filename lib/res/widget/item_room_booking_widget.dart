import 'package:flutter/material.dart';

import '../core/constants/dimension_constants.dart';
import '../core/helpers/image_helper.dart';
import 'buttom_widget.dart';
import 'item_utility_widge.dart';

class ItemRoomBookingwidge extends StatelessWidget {
  const ItemRoomBookingwidge(
      {super.key,
      required this.roomImage,
      required this.roomName,
      required this.roomPrice,
      required this.roomUtility,
      required this.roomSize,
      this.onTap,
      required this.numberOfRoom});
  final String roomImage;
  final String roomName;
  final int roomPrice;
  final String roomUtility;
  final int roomSize;
  final int? numberOfRoom;
  final Function()? onTap;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
              Expanded(child: Container(
                child: ImageHelper.loadFromAsset(roomImage,
                    radius: BorderRadius.all(Radius.circular(kMinPadding))),
              ))
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
              if(numberOfRoom != null)SizedBox(width: kMediumPadding * 6,),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(
                        title: "Book a room",
                        ontap: onTap,
                      )
                    : Text('$numberOfRoom room'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
