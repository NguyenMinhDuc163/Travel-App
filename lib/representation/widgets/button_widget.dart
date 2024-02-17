import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({Key? key, required this.data, this.onTap, this.color}) : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold.copyWith(
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
    );
  }
}
