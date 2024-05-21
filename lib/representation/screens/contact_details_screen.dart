import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../data/models/user_contact_model.dart';
import '../../provider/hotel_booking_provider.dart';
import '../widgets/buttom_widget.dart';
import 'check_out_screen.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({super.key});
  static const routeName = 'contact_details_screen';
  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppBarContinerWidget(
          titleString: "Contact Detail",
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kDefaultPadding * 3,
                ),
                TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: nameController,
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
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                    Provider.of<HotelBookingProvider>(context, listen: false)
                        .setUserModel(UserContactModel(nameController.text,
                        phoneNumberController.text, emailController.text));
                    print(Provider.of<HotelBookingProvider>(context, listen: false).userContactModel);
                    Navigator.of(context).popUntil(
                            (route) => route.settings.name == CheckOutScreen.routeName);
                  },
                )
              ],
            ),
          )),
    );
  }
}
