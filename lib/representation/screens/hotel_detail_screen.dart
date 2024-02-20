import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_widge.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import '../../data/models/hotel_model.dart';

class HotelDetailScreen extends StatefulWidget {
  static const String routeName = '/detail_hotel_screen';

  const HotelDetailScreen({
    Key? key,
    required this.hotelModel,
  }) : super(key: key);

  final HotelModel hotelModel;
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
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
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding)),
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
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding)),
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
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: TextStyles.defaultStyle.fontHeader.bold,
                              ),
                              Spacer(),
                              Text(
                                '\$${widget.hotelModel.price.toString()}',
                                style: TextStyles.defaultStyle.fontHeader.bold,
                              ),
                              Text(
                                ' /night',
                                style: TextStyles.defaultStyle.fontCaption,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                  AssetHelper.icoLocationBlank),
                              SizedBox(
                                width: kMinPadding,
                              ),
                              Text(
                                widget.hotelModel.location,
                              )
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.icoStar),
                              SizedBox(
                                width: kMinPadding,
                              ),
                              Text(
                                '${widget.hotelModel.star}/5',
                              ),
                              Text(
                                ' (${widget.hotelModel.numberOfReview})',
                                style: TextStyle(
                                    color: ColorPalette.subTitleColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Infomation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),

                          ItemUtilityWidge(),

                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(AssetHelper.imageMap),
                          SizedBox(
                            height: kDefaultPadding * 2,
                          ),
                          ButtonWidget(
                            title: 'Select Room',
                            ontap: () {
                              Navigator.of(context)
                                  .pushNamed(SelectRoomScreen.routeName);
                            },
                          ),
                        ],
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
    ;
  }
}
