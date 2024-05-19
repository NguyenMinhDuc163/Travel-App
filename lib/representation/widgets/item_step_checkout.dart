import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/image_helper.dart';

class ItemStepCheckOut extends StatefulWidget {
  const ItemStepCheckOut({super.key, required this.step, required this.stepName, required this.isEnd, required this.isCheck});
  final int step; final String stepName; final bool isEnd;final  bool isCheck;
  State<ItemStepCheckOut> createState() => _ItemStepCheckOutState();
}

class _ItemStepCheckOutState extends State<ItemStepCheckOut> {

  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Container(
            width: kMediumPadding,
            height: kMediumPadding,
            decoration: BoxDecoration(
              color: widget.isCheck ? Colors.white : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(kMediumPadding),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.step.toString(),
              style: TextStyle(
                color: widget.isCheck ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: kMinPadding,
          ),
          Text(
            widget.stepName,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          SizedBox(
            width: kMinPadding +  3,
          ),
          if (!widget.isEnd)
            SizedBox(
              width: kDefaultPadding,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),
            ),
          if (!widget.isEnd)
            SizedBox(
              width: kMinPadding,
            ),
        ],
      ),
    );
  }
}
