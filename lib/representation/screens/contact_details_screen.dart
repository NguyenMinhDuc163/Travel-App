import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../widgets/buttom_widget.dart';
import 'check_out_screen.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({super.key});
  static const routeName = 'contact_details_screen';
  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
        titleString: "Contact Detail",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kDefaultPadding * 3,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.user),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Phone Number',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.phone),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.envelope),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              'E-ticket will be sent to your E-mail',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: kDefaultPadding,),
            ButtonWidget(
              title: 'Done',
              ontap: () {
                Navigator.of(context).popUntil(
                        (route) => route.settings.name == CheckOutScreen.routeName);
              },
            )
          ],
        ));
  }
}
