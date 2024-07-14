import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../global/common/toast.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';



class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen({super.key});

  static const String routeName = '/change_password_screen';
  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
  final _auth = FirebaseAuth.instance;
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isSubmitting = false;

  // Biến trạng thái để ẩn/hiện mật khẩu
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _changePassword() async {
    setState(() {
      isSubmitting = true;
    });
    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      showToastTop(message: 'Please fill in all fields');
      setState(() {
        isSubmitting = false;
      });
      return;
    }

    if (newPassword.length < 6) {
      showToastTop(message: 'New password must be at least 6 characters long');
      setState(() {
        isSubmitting = false;
      });
      return;
    }

    if (newPassword != confirmPassword) {
      showToastTop(message: 'New password and confirmation do not match');
      setState(() {
        isSubmitting = false;
      });
      return;
    }

    try {
      User? user = _auth.currentUser;
      String email = user!.email!;

      // Xác thực lại người dùng
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // Cập nhật mật khẩu
      await user.updatePassword(newPassword);

      showToastTop(message: 'Password updated successfully!');
    } catch (e) {
      showToastTop(message: 'Failed to update password');
      print('Failed to update password: $e');
    }

    setState(() {
      isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppBarContinerWidget(
        titleString: 'Change Password',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kDefaultPadding * 5,
              ),
              TextField(
                controller: _currentPasswordController,
                obscureText: _obscureCurrentPassword,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Current Password',
                  hintText: 'Enter your Current password',
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureCurrentPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureCurrentPassword = !_obscureCurrentPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextField(
                controller: _newPasswordController,
                obscureText: _obscureNewPassword,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'New Password',
                  hintText: 'Enter your New password',
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Confirm New Password',
                  hintText: 'Enter your Confirm New password',
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ButtonWidget(
                title: 'Change Password',
                isign: isSubmitting,
                ontap: _changePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
