import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/textstyle_ext.dart';

import '../../core/constants/color_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() ? ontap;
  const ButtonWidget({Key? key, required this.title, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
