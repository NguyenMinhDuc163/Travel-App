import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/representation/screens/login_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';

import '../../core/constants/dimension_constants.dart';
import '../../global/common/toast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = '/forgot_password_screen';
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isForgot = false;
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Forgot Password',
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 5,
          ),
          TextField(
            style: TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email ',
                hintText: 'Nhâp email của bạn',
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
          ButtonWidget(
            title: 'Send',
            isign: _isForgot,
            ontap: () async {
              setState(() {
                _isForgot = true;
              });
              await Future.delayed(const Duration(seconds: 1));
              Navigator.of(context).pushNamed(MainApp.routeName);
              showToast(
                  message:
                      'Password reset successfully, please check your email');
              setState(() {
                _isForgot = false;
              });
            },
          )
        ],
      ),
    );
  }
}
