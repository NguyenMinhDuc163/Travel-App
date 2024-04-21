import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/ticket_stub_screen.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/buttom_widget.dart';
import '../widgets/item_step_checkout.dart';
import 'add_card_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});
  static const String routeName = '/payment_method_screen';
  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  Widget build(BuildContext context) {

    Widget _buildRowCustom(String icon, String content, {Widget? add}){
      return Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        padding: (add != null) ?  EdgeInsets.only(bottom: kDefaultPadding) : null,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(kDefaultPadding)),
          color: Colors.grey.shade50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset(icon)),
                Expanded(child: Text(content, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), flex: 2,),
                Expanded(child: Container(
                  width: 30,  // Kích thước chiều rộng của hình tròn
                  height: 30, // Kích thước chiều cao của hình tròn
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.15), // Màu của hình tròn
                    shape: BoxShape.circle, // Đặt hình dạng là hình tròn
                  ),
                ))
              ],
            ),
            (add != null) ? add : Container()
          ],
        ),
      );
    }
    
    Widget _buildAddCard(String value){
      return Container(
        padding: EdgeInsets.all(kMinPadding),
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(
            40,
          ),
        ),

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
              value,
              style: TextStyles.defaultStyle.primaryTextColor.bold,
            ),
          ],
        ),
      );
    }
    return AppBarContinerWidget(
        titleString: 'Checkout',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: listSteps
                    .map((e) => ItemStepCheckOut(
                  step: listSteps.indexOf(e) + 1,
                  stepName: e,
                  isEnd: listSteps.indexOf(e) == listSteps.length - 1,
                  isCheck: listSteps.indexOf(e) == 1,
                ))
                    .toList(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              _buildRowCustom(AssetHelper.icoMarket, "Mini Market"),
              _buildRowCustom(AssetHelper.icoPayment, "Credit / Debit Card", add: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AddCardScreen.routeName);
                },
                child: _buildAddCard('Add Card'),
              )),
              _buildRowCustom(AssetHelper.icoPayment, "Bank Transfer"),

              ButtonWidget(
                title: 'Pay now',
                ontap: () {
                  Navigator.of(context)
                      .pushNamed(TicketStubScreen.routeName);
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ));
  }
}
