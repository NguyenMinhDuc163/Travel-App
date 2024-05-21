import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/check_out_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';

class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});
  static const routeName = 'promo_code_screen';
  @override
  State<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppBarContinerWidget(
        titleString: 'Promo Code',
        child: Column(
          children: [
            SizedBox(height: kDefaultPadding * 3,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Coupon code',
                filled: true,
                fillColor: Colors.white60,
                border: OutlineInputBorder( // Tạo border xung quanh TextField
                  borderRadius: BorderRadius.circular(8.0), // Bo tròn border
                  borderSide: BorderSide.none, // Bỏ viền
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      // Xử lý khi nút ấn được nhấn
                      Fluttertoast.showToast(
                          msg: 'Invalid Promotion Code',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: ImageHelper.loadFromAsset(AssetHelper.icoAddCode)
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding,),
            ButtonWidget(title: "Done", ontap: (){
              Navigator.of(context).popUntil(
                      (route) => route.settings.name == CheckOutScreen.routeName);
            },),
          ],
        ),
      ),
    );
  }
}
