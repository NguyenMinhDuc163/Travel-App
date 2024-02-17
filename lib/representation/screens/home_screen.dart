import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

import '../../core/constants/textstyle_ext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Map<String, String>> listImageLeft = [
  {
    'name': 'Korea',
    'image': AssetHelper.korea,
  },
  {
    'name': 'Dubai',
    'image': AssetHelper.dubai,
  },
];
final List<Map<String, String>> listImageRight = [
  {
    'name': 'Turkey',
    'image': AssetHelper.turkey,
  },
  {
    'name': 'Japan',
    'image': AssetHelper.japan,
  },
];
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hi Jame",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorPalette.subTitleColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.person),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Search your desination",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultPadding,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: kItemPadding,
                )),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotel,
                      width: kDefaultPadding,
                      height: kDefaultPadding,
                    ),
                    Color(0xffFe9c5e), () {
                  Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                }, "Hotel"),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoPlane,
                      width: kDefaultPadding,
                      height: kDefaultPadding,
                    ),
                    Color(0xfff77777),
                    () => null,
                    "Flights"),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotelPlane,
                      width: kDefaultPadding,
                      height: kDefaultPadding,
                    ),
                    Color(0xfff77777),
                    () => null,
                    "All"),
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Text(
                'Popular Destinations',
                style: TextStyles.defaultStyle.bold,
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyles.defaultStyle.bold.primaryTextColor,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        children: listImageLeft
                            .map(
                              (e) => _buidlImageHomScreen(
                            e['name']!,
                            e['image']!,
                          ),
                        )
                            .toList(),
                        ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                        children: listImageRight
                            .map(
                              (e) => _buidlImageHomScreen(
                            e['name']!,
                            e['image']!,
                          ),
                        )
                            .toList(),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// tao 1 widget dung chung cho page
Widget _buildItemCategory(
    Widget icon, Color color, Function() onTap, String title) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: kMediumPadding,
          ),
          child: icon,
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding)),
        ),
        SizedBox(
          height: kItemPadding,
        ),
        Text(title)
      ],
    ),
  );
}

Widget _buidlImageHomScreen(String name, String image) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).pushNamed(HotelBookingScreen.routeName, arguments: name);
    },
    child: Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ImageHelper.loadFromAsset(
            image,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            radius: BorderRadius.circular(kItemPadding),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: kDefaultPadding,
            bottom: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.defaultStyle.whiteTextColor.bold,
                ),
                SizedBox(
                  height: kItemPadding,
                ),
                Container(
                  padding: EdgeInsets.all(kMinPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMinPadding),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color(0xffFFC107),
                      ),
                      SizedBox(
                        width: kItemPadding,
                      ),
                      Text('4.5')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}