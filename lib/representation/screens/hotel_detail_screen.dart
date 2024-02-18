import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key});
  static const String routeName = 'hotel_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.hotelScreen,
                fit: BoxFit.fill),
          ),
          Positioned(
            top: kMediumPadding * 3,
              left: kMediumPadding,
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(kItemPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                color: Colors.white,
              ),
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                size: 18,
              ),
            ),
          )),

          Positioned(
              top: kMediumPadding * 3,
              right: kMediumPadding,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.white,
                  ),
                  child: Icon(
                    FontAwesomeIcons.solidHeart,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              )),
          DraggableScrollableSheet(
            // mot man hinh nho co the keo len kheo xuong
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kItemPadding)),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
