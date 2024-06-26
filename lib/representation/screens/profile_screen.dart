import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/global/common/toast.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/login_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';
import 'package:travel_app/representation/screens/user_profile_sceen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../provider/UserProvider.dart';
import '../../test.dart';
import '../widgets/item_booking_widget.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile_screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        titleString: "Profile",
        subTitleString: Provider.of<UserProvider>(context, listen: false).user?.userName.toString() ?? 'nguyen van a',
        email: Provider.of<UserProvider>(context, listen: false).user?.email.toString() ?? 'abc@gmail.com',
        avatar: AssetHelper.avatarProfile,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kDefaultPadding * 3,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'My account',
                description: 'Make changes to your account',
                iconFWA: FontAwesomeIcons.user,
                onTap: (){
                  Navigator.of(context).pushNamed(UserProfileScreen.routeName);
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'Change Password',
                description: 'Manage your saved account',
                iconFWA: FontAwesomeIcons.user,
                onTap: (){
                  Navigator.of(context).pushNamed(ChangePassWordScreen.routeName);
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'Face ID / Touch ID',
                description: 'Manage your device security',
                iconFWA: FontAwesomeIcons.lock,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'Two-Factor Authentication',
                description: 'Further secure your account for safety',
                iconFWA: FontAwesomeIcons.shield,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'Log out',
                description: 'Further secure your account for safety',
                iconFWA: FontAwesomeIcons.rightToBracket,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName,
                        (Route<dynamic> route) => false,
                  );
                  showToast(message: 'Successfully logged out');
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                'More',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'Help & Support',
                description: 'Help & Support',
                iconFWA: FontAwesomeIcons.bell,
                onTap: () {},
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ItemBookingWidget(
                icon: AssetHelper.person,
                title: 'About App',
                description: 'About App',
                iconFWA: FontAwesomeIcons.heart,
                onTap: () {},
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
