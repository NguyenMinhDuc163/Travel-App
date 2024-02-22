import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';

import '../../core/constants/textstyle_ext.dart';
import 'main_app.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.roomModel});
  final RoomModel roomModel;
  static const String routeName = '/check_out_screen';
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemOptionsCheckout(
      String icon, String title, String value, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemStepCheckOut(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(
          stepName,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Checkout Screen",
      //ToDo
      child: Column(
        children: [
          Row(
            children: listSteps
                .map((e) => _buildItemStepCheckOut(
                    listSteps.indexOf(e) + 1,
                    e,
                    listSteps.indexOf(e) == listSteps.length - 1,
                    listSteps.indexOf(e) == 0))
                .toList(),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
              child: SingleChildScrollView(
            // nhu the nay se co dinh thanh tabar
            child: Column(
              children: [
                ItemRoomBookingwidge(
                  roomImage: widget.roomModel.roomImage,
                  roomName: widget.roomModel.roomName,
                  roomPrice: widget.roomModel.price,
                  roomUtility: widget.roomModel.utility,
                  roomSize: widget.roomModel.size,
                  onTap: () {},
                  numberOfRoom: 1,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                _buildItemOptionsCheckout(AssetHelper.icoUser, 'Contact detail',
                    'Add contact', context),
                SizedBox(
                  height: kDefaultPadding,
                ),
                _buildItemOptionsCheckout(AssetHelper.icoPromo, 'Promo code',
                    'Add promo code', context),
                SizedBox(
                  height: kDefaultPadding,
                ),
                ButtonWidget(
                  title: 'Payment',
                  ontap: () {
                    Navigator.of(context).popUntil(
                        (route) => route.settings.name == MainApp.routeName);
                  },
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
