import 'package:flutter/cupertino.dart';

import '../res/core/helpers/asset_helper.dart';
import '../res/core/helpers/image_helper.dart';
import '../res/core/helpers/local_storage_helper.dart';
import 'intro_screen.dart';

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
    await Future.delayed(const Duration(milliseconds: 1000));
    // if(ignoreIntroScreen != null && ignoreIntroScreen){
    //   Navigator.of(context).pushNamed(LoginScreen.routeName);
    // }
    // else{
    //   LocalStorageHelper.setValue('ignoreIntroScreen', true);
    //   Navigator.of(context).pushNamed(IntroScreen.routeName);
    // }
    Navigator.of(context).pushNamed(IntroScreen.routeName);
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
