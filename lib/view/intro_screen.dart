import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../res/core/constants/dimension_constants.dart';
import '../res/core/constants/textstyle_ext.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/core/helpers/image_helper.dart';
import '../res/widget/buttom_widget.dart';
import '../utils/routes/router_names.dart';
import 'auth/login_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String routeName = '/intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _streamController = StreamController<int>();

  // tao ra widget dung trung: truyen cac tham so
  Widget _buildItemIntroScreen(String image, String title, String descripton,
      AlignmentGeometry alignmentDirectional) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: alignmentDirectional,
            child: ImageHelper.loadFromAsset(image,
                height: 400, fit: BoxFit.fitHeight)),
        const SizedBox(
          height: kMediumPadding * 2, // cach khoang 50 px
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding, // cach khoang 50 px
              ),
              Text(
                descripton,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
                AssetHelper.slide1,
                "Book a flight",
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight),
            _buildItemIntroScreen(
                AssetHelper.slide2,
                "Find a hotel room",
                'Select the day, book your room. We give you the best price',
                Alignment.centerRight),
            _buildItemIntroScreen(
                AssetHelper.slide3,
                "Enjoy your trip",
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft),
          ],
        ),
        Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding * 2,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
              ),
              StreamBuilder<int>(
                  // neu dung nhu the nay chi rendew buttom chu khong render ca man hinh
                  stream: _streamController.stream,
                  initialData: 0, // tranh gt null
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ButtonWidget(
                        title: (snapshot.data != 2) ? 'Next' : 'Get Started',
                        ontap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInSine);
                          } else {
                            Navigator.of(context).pushNamed(RouteNames.loginScreen);
                          }
                        },
                      ),
                    );
                  }),
            ],
          ),
        )
      ],
    ));
  }
}
