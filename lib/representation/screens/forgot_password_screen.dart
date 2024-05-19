import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Thêm dòng này
import '../../core/constants/dimension_constants.dart';
import '../../global/common/send_mail.dart';
import '../../global/common/toast.dart';
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
  void resetPassword(BuildContext context) async {
    setState(() {
      _isForgot = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      showToast(
        message: 'Password reset email sent successfully. Please check your email.',
      );
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    } catch (e) {
      showToast(
        message: 'Failed to send password reset email: $e',
      );
    } finally {
      setState(() {
        _isForgot = false;
      });
    }

    // try {
    //   await _sendEmailService.sendEmail(
    //     emailController.text, // Email người nhận
    //     'Xác nhận hóa đơn',
    //     'Hóa đơn của bạn đã được tạo thành công.',
    //   );
    //
    //   // Hiển thị thông báo thành công
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text('Hóa đơn đã được tạo và email xác nhận đã được gửi.'),
    //   ));
    // } catch (e) {
    //   // Hiển thị thông báo lỗi
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text('Đã xảy ra lỗi khi gửi email: $e'),
    //   ));
    // }

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
