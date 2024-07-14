import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view/profile/user_profile_sceen.dart';
import 'package:travel_app/viewModel/user_viewmodel.dart';
import '../../global/common/toast.dart';
import '../../res/core/constants/dimension_constants.dart';
import '../../res/core/helpers/asset_helper.dart';
import '../../res/widget/app_bar_container.dart';
import '../../res/widget/item_booking_widget.dart';
import '../../utils/routes/router_names.dart';
import 'change_password_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
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
        subTitleString: Provider.of<UserViewModel>(context, listen: false).user?.userName.toString() ?? 'nguyen van a',
        email: Provider.of<UserViewModel>(context, listen: false).user?.email.toString() ?? 'abc@gmail.com',
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
                  Navigator.of(context).pushNamed(RouteNames.userProfileScreen);
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
                  Navigator.of(context).pushNamed(RouteNames.changePasswordScreen);
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
                    RouteNames.loginScreen,
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
