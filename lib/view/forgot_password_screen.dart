import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../global/common/send_mail.dart';
import '../global/common/toast.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = '/forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool _isForgot = false;
  final SendEmailService _sendEmailService = SendEmailService();

  bool isValidEmail(String email) {
    // Biểu thức chính quy kiểm tra cú pháp email
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Kiểm tra email có khớp với biểu thức chính quy hay không
    return emailRegExp.hasMatch(email);
  }
  void resetPassword(BuildContext context) async {
    setState(() {
      _isForgot = true;
    });
    if(isValidEmail(emailController.text) == false){
      showToastTop(
        message: 'Invalid email. Please check again',
      );
      setState(() {
        _isForgot = false;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      showToastTop(
        message: 'Password reset email sent successfully. Please check your email.',
      );
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    } catch (e) {
      showToastTop(
        message: 'Failed to send password reset email',
      );
      print("log ------------------- ${e.toString()}");
    } finally {
      setState(() {
        _isForgot = false;
      });
    }



  }

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
            controller: emailController,
            style: TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Email',
              hintText: 'Nhập email của bạn',
              prefixIcon: Container(
                width: 1,
                child: Icon(FontAwesomeIcons.envelope),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Send',
            isign: _isForgot,
            ontap: () => resetPassword(context),
          ),
        ],
      ),
    );
  }
}
