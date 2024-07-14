import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/view/payment/payment_method_screen.dart';

import '../../res/core/constants/dimension_constants.dart';
import '../../res/core/helpers/asset_helper.dart';
import '../../res/widget/app_bar_container.dart';
import '../../res/widget/buttom_widget.dart';
import '../../utils/routes/router_names.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String? _selectedValue = 'Vietnamese'; // The currently selected value

  Widget _textFieldCustom(String title, TextInputType textInputType,
      {String? icon}) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        color: Colors.grey.shade50,
      ),
      child: TextFormField(
        keyboardType: textInputType,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Thiết lập chữ in đậm
          fontSize: 16, // Bạn cũng có thể chỉ định kích thước font ở đây nếu cần
        ),
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: (icon != null)
              ? Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  child: Image.asset(icon))
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GestureDetector(
        behavior: HitTestBehavior
            .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
        onTap: () {
          // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AppBarContinerWidget(
          titleString: 'Add Card',
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kDefaultPadding * 3,
                ),
                _textFieldCustom("Name", TextInputType.text),
                _textFieldCustom(
                  "Card Number",
                  TextInputType.number,
                  icon: AssetHelper.cardBank,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child:
                        _textFieldCustom("Exp. Date", TextInputType.number)),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Expanded(
                        child: _textFieldCustom("CVV", TextInputType.number)),
                  ],
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border.all(
                        color: Colors.black38, // Màu viền
                        width: 1, // Độ dày của viền
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child:DropdownButton<String>(
                    value: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                    items: <String>['Vietnamese', 'Myanmar', 'Japan', 'China']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.earthAsia), // Icon
                            SizedBox(width: 10), // Khoảng cách
                            Text(value), // Text
                          ],
                        ),
                      );
                    }).toList(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: ButtonWidget(
                    title: 'Add Card',
                    ontap: () {
                      Navigator.of(context)
                          .pushNamed(RouteNames.paymentMethodScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
