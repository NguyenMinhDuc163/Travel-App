import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/constants/dimension_constants.dart';

class EvaluationWidget extends StatelessWidget {
  const EvaluationWidget({super.key, required this.score, this.reviewNum});
  final double score;
  final int? reviewNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFFFFC107),
                ),
              ),
              Text('of 5', style: TextStyle(fontSize: 12),),
              Text('(${reviewNum ?? 9876} Review)', style: TextStyle(fontSize: 12),),
            ],
          ),
          SizedBox(width: kMinPadding,),
          ImageHelper.loadFromAsset(AssetHelper.starScore),
        ],
      ),
    );
  }
}
