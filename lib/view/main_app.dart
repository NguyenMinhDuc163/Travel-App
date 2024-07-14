import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/view/profile_screen.dart';
import 'package:travel_app/view/ratiing_screen.dart';
import '../res/core/constants/dimension_constants.dart';
import 'booking_flight_screen.dart';
import 'home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  static const String routeName = "/main_app";
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0; // chuyen tab
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack( // ket hop voi bottomNavigationBar de dieu khien trang thai khi an
          index: _currentIndex,
          children: const [
            HomeScreen(),
            RattingScreen(),
            BookingFlightScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar( // tao ra 1 thanh buttom bar bang thu vien
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() { // khong toi uu performent
              _currentIndex = index; // khi nguoi dung an vao icon thi mau se chuyen theo
            });
          },
          items: [
            SalomonBottomBarItem( // su dung thu vien
              icon: Icon(FontAwesomeIcons.house,
              size: kDefaultIconSize,),
              title: Text("Home"),
            ),
            SalomonBottomBarItem( // su dung thu vien
              icon: Icon(FontAwesomeIcons.solidHeart,
                size: kDefaultIconSize,),
              title: Text("Likes"),
            ),
            SalomonBottomBarItem( // su dung thu vien
              icon: Icon(FontAwesomeIcons.briefcase,
                size: kDefaultIconSize,),
              title: Text("Booking"),
            ),
            SalomonBottomBarItem( // su dung thu vien
              icon: Icon(FontAwesomeIcons.solidUser,
                size: kDefaultIconSize,),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
