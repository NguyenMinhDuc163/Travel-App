import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectIntroScreen(); // doi tre 2s
  }
  void redirectIntroScreen() async{
    // man hinh nay chi xuat hien trong lan khoi dong dau tien
    final ignoreIntroScreen = LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(seconds: 1));
    if(ignoreIntroScreen != null && ignoreIntroScreen){
      Navigator.of(context).pushNamed(MainApp.routeName);
    }
    else{
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }
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
