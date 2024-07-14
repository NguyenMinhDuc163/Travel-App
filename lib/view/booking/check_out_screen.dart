import 'package:flutter/material.dart';

import '../../models/room_model.dart';
import '../../res/core/constants/dimension_constants.dart';
import '../../res/core/helpers/asset_helper.dart';
import '../../res/widget/app_bar_container.dart';
import '../../res/widget/buttom_widget.dart';
import '../../res/widget/item_option_checkout_widget.dart';
import '../../res/widget/item_room_booking_widget.dart';
import '../../res/widget/item_step_checkout.dart';
import '../../utils/routes/router_names.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.roomModel});
  final RoomModel roomModel;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];


  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Checkout Screen",
      //ToDo
      child: Column(
        children: [
          Row(
            children: listSteps
                .map((e) => ItemStepCheckOut(
                      step: listSteps.indexOf(e) + 1,
                      stepName: e,
                      isEnd: listSteps.indexOf(e) == listSteps.length - 1,
                      isCheck: listSteps.indexOf(e) == 0,
                    ))
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

                ItemOptionsCheckoutWidget(icon: AssetHelper.icoUser, title: 'Contact detail', value: 'Add contact',
                  context: context, onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.contactDetailsScreen);
                  },),
                SizedBox(
                  height: kDefaultPadding,
                ),

                ItemOptionsCheckoutWidget(icon: AssetHelper.icoPromo, title: 'Promo code', value: 'Add promo code',
                  context: context, onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.promoCodeScreen);
                  },),
                SizedBox(
                  height: kDefaultPadding,
                ),
                ButtonWidget(
                  title: 'Payment',
                  ontap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.paymentMethodScreen);
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
