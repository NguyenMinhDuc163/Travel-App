import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/provider/hotel_booking_provider.dart';
import 'package:travel_app/representation/screens/home_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import '../../provider/UserProvider.dart';
import '../widgets/buttom_widget.dart';
import '../widgets/dashline_widge.dart';
import '../widgets/invoid_widget.dart';
import '../widgets/item_step_checkout.dart';
import 'main_app.dart';

class HotelInvoiceScreen extends StatefulWidget {
  const HotelInvoiceScreen({super.key});
  static const String routeName = '/hotel_invoice_screen';
  @override
  State<HotelInvoiceScreen> createState() => _HotelInvoiceScreenState();
}

class _HotelInvoiceScreenState extends State<HotelInvoiceScreen> {
  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Checkout',
      child: SingleChildScrollView(
        child: Consumer<HotelBookingProvider>(
          builder: (context, data, _){
            return Column(
              children: [
                Row(
                  children: listSteps
                      .map((e) => ItemStepCheckOut(
                    step: listSteps.indexOf(e) + 1,
                    stepName: e,
                    isEnd: listSteps.indexOf(e) == listSteps.length - 1,
                    isCheck: listSteps.indexOf(e) == 2,
                  ))
                      .toList(),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Column(
                        children:  [
                          Text(
                            data.hotelModel!.hotelName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.hotelModel!.location,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),),
                      Container(child: Icon(
                        FontAwesomeIcons.hotel,
                        size: 30,
                      ),)
                    ],
                  ),
                ),
                DashLineWidget(
                  color: Colors.black45,
                ),
                InvoidWidget(
                  airline: data.hotelModel!.hotelName,
                  passenger: Provider.of<UserProvider>(context, listen: false)
                      .user
                      ?.userName
                      .toString() ??
                      'nguyen van a',
                  //TODO
                  logo: AssetHelper.hotelScreen,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.grey.shade50,
                  ),
                  child: Column(
                    children: [
                      _rowCustom('1 Phòng Deluxe', '\$145'),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      _rowCustom('Thuế và phí', '\$15'),
                      DashLineWidget(
                        color: Colors.black45,
                      ),
                      _rowCustom('Tổng cộng', '\$160', bold: true),
                    ],
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Image.asset(AssetHelper.cardBank)),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Credit / Debit Card',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              'Master Card',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            print("---------- da an");
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ButtonWidget(
                  title: 'Pay now',
                  ontap: () {
                    Fluttertoast.showToast(
                        msg: 'Payment success',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    Navigator.of(context).pushNamed(MainApp.routeName);
                  },
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _rowCustom(String left, String right, {bool? bold}) {
    return Row(
      children: [
        Text(
          left,
          style: TextStyle(
              fontSize: 15,
              fontWeight:
              (bold != null) ? FontWeight.bold : FontWeight.normal),
        ),
        Spacer(),
        Text(
          right,
          style: TextStyle(
              fontSize: 15,
              fontWeight:
              (bold != null) ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
