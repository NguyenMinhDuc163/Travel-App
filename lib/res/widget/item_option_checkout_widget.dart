import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/dimension_constants.dart';
import '../core/constants/textstyle_ext.dart';
import '../core/helpers/image_helper.dart';

class ItemOptionsCheckoutWidget extends StatefulWidget {
  const ItemOptionsCheckoutWidget({super.key, required this.icon, required this.title, required this.value, required this.context, required this.onTap});
  final String icon;final  String title; final  String value;
  final BuildContext context; final  VoidCallback onTap;
  @override
  State<ItemOptionsCheckoutWidget> createState() => _ItemOptionsCheckoutWidgetState();
}

class _ItemOptionsCheckoutWidgetState extends State<ItemOptionsCheckoutWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageHelper.loadFromAsset(
                  widget.icon,
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  widget.title,
                  style: TextStyles.defaultStyle.bold,
                ),
              ],
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: ColorPalette.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                  SizedBox(width: kDefaultPadding),
                  Text(
                    widget.value,
                    style: TextStyles.defaultStyle.primaryTextColor.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
