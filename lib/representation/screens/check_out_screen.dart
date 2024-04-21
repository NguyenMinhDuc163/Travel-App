import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/screens/payment_method_screen.dart';
import 'package:travel_app/representation/screens/promo_code_screen.dart';
import 'package:travel_app/representation/screens/ticket_stub_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';

import '../../core/constants/textstyle_ext.dart';
import '../widgets/item_option_checkout_widget.dart';
import '../widgets/item_step_checkout.dart';
import 'contact_details_screen.dart';
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
                        .pushNamed(ContactDetailsScreen.routeName);
                  },),
                SizedBox(
                  height: kDefaultPadding,
                ),

                ItemOptionsCheckoutWidget(icon: AssetHelper.icoPromo, title: 'Promo code', value: 'Add promo code',
                  context: context, onTap: () {
                    Navigator.of(context)
                        .pushNamed(PromoCodeScreen.routeName);
                  },),
                SizedBox(
                  height: kDefaultPadding,
                ),
                ButtonWidget(
                  title: 'Payment',
                  ontap: () {
                    Navigator.of(context)
                        .pushNamed(PaymentMethodScreen.routeName);
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
