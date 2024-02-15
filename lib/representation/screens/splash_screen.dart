import 'package:flutter/cupertino.dart';

import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.backgroundSplash, fit: BoxFit.fitWidth),
        ), // cho full man hinh
        Positioned.fill(child: ImageHelper.loadFromAsset(AssetHelper.circleSplash))
      ],
    );
  }
}
