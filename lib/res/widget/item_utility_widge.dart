import 'package:flutter/cupertino.dart';

import '../core/constants/dimension_constants.dart';
import '../core/helpers/asset_helper.dart';
import '../core/helpers/image_helper.dart';
class ItemUtilityWidge extends StatelessWidget {
  const ItemUtilityWidge({super.key});
  static const List<Map<String, String>> listUtility = [
    {'icon': AssetHelper.icoWifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Free-\nBreakfast'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'Non-\nSmoking'},
  ];

  Widget _buildItemUtilityHotel(String icon, String title) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        SizedBox(
          height: kTopPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // khoang cach giua bang nhau
        children: listUtility
            .map((e) => _buildItemUtilityHotel(e['icon']!, e['name']!))
            .toList(),
      ),
    );
  }
}
