import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class InfoFlightWidget extends StatelessWidget {
  const InfoFlightWidget({super.key, required this.icon, required this.textUp, required this.textDown});
  final String icon;
  final String textUp;
  final String textDown;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: 325, height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        color: Colors.white,
      ),
      child: Row(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageHelper.loadFromAsset(icon),
          ),
          SizedBox(width: screenSize.width * 0.1,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textUp, style: TextStyle(fontSize: 12),),
              Text(textDown, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}
