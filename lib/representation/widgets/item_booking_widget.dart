import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      this.onTap,
      this.iconFWA});
  final String icon;
  final String title;
  final String description;
  final IconData? iconFWA;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
        ),
        child: iconFWA == null
            ? Row(
                children: [
                  Image.asset(
                    icon,
                    width: 36,
                    height: 36,
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      SizedBox(
                        height: kItemPadding,
                      ),
                      Text(
                        description,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Icon(iconFWA),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: kItemPadding,
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 13,),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
