import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/home_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../provider/UserProvider.dart';
import '../widgets/buttom_widget.dart';
import '../widgets/dashline_widge.dart';
import '../widgets/invoid_widget.dart';
import '../widgets/item_step_checkout.dart';
import 'hotel_invoice_screen.dart';
import 'hotel_screen.dart';
import 'main_app.dart';

class TicketStubScreen extends StatefulWidget {
  const TicketStubScreen({super.key});
  static const String routeName = '/ticket_stub_screen';
  @override
  State<TicketStubScreen> createState() => _TicketStubScreenState();
}

class _TicketStubScreenState extends State<TicketStubScreen> {
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
          child: Column(
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
                  color: Colors.grey.shade50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'JKT',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Jakarta',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: 25,
                      color: Colors.black,
                    ),
                    Icon(
                      FontAwesomeIcons.plane,
                      size: 30,
                    ),
                    Container(
                      height: 1,
                      width: 25,
                      color: Colors.black,
                    ),
                    Column(
                      children: const [
                        Text(
                          'SBY',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Surabaya',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              DashLineWidget(
                color: Colors.black45,
              ),
              InvoidWidget(
                airline: "VietNam airline",
                passenger: Provider.of<UserProvider>(context, listen: false)
                        .user
                        ?.userName
                        .toString() ??
                    'nguyen van a',
                logo: AssetHelper.logoAir,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
                  color: Colors.grey.shade50,
                ),
                child: Column(
                  children: [
                    _rowCustom('1 Passenger', '\$215'),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    _rowCustom('Insurance', '-'),
                    DashLineWidget(
                      color: Colors.black45,
                    ),
                    _rowCustom('Total', '\$215', bold: true),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
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
                          )),
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
                  Navigator.of(context)
                      .pushNamed(MainApp.routeName);
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ));
  }

  Widget _rowCustom(String left, String right, {bool? bold}) {
    return Row(
      children: [
        Text(
          left,
          style: TextStyle(
              fontSize: 15,
              fontWeight: (bold != null) ? FontWeight.bold : FontWeight.normal),
        ),
        Spacer(),
        Text(
          right,
          style: TextStyle(
              fontSize: 15,
              fontWeight: (bold != null) ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
