import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/viewModel/hotel_booking_viewmodel.dart';
import 'package:travel_app/viewModel/user_viewmodel.dart';
import '../global/common/send_mail.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
import '../res/widget/dashline_widge.dart';
import '../res/widget/invoid_widget.dart';
import '../res/widget/item_step_checkout.dart';
import 'main_app.dart';

class TicketStubScreen extends StatefulWidget {
  const TicketStubScreen({super.key});
  static const String routeName = '/ticket_stub_screen';
  @override
  State<TicketStubScreen> createState() => _TicketStubScreenState();
}

class _TicketStubScreenState extends State<TicketStubScreen> {
  final List<String> listSteps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];
  bool showDialog = false;
  Future<void> createInvoice(BuildContext context, String email) async {
    final sendEmailService = SendEmailService();
    String name = 'Nguyen Minh Duc';
    String flightDetails = '''
  Chuyến bay: VN123
  Ngày bay: 01/06/2024
  Hạng ghế: Hạng thương gia
  Số hành khách: 2
  ''';

    try {
      await sendEmailService.sendEmail(
          email, // Email người nhận
          'Xác nhận hóa đơn đặt vé máy bay',
          '''
Kính gửi $name,

Cảm ơn quý khách đã chọn dịch vụ chuyển bay XYZ cho chuyến đi của mình. Dưới đây là thông tin hóa đơn cho chuyến bay của quý khách:

Thông tin chuyến bay:
$flightDetails

Chi tiết hóa đơn:
Vé hạng thương gia: \$500
Thuế và phí: \$50

Tổng cộng: \$550

Xin vui lòng thanh toán số tiền trên trong vòng 7 ngày để hoàn tất thủ tục. Nếu quý khách có bất kỳ thắc mắc hoặc yêu cầu hỗ trợ, xin vui lòng liên hệ với chúng tôi qua email này hoặc gọi đến số điện thoại 0123-456-789.

Chúng tôi mong được phục vụ quý khách trong những chuyến bay tiếp theo.

Trân trọng,
Dịch vụ Chuyển Bay XYZ
'''
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Hóa đơn đã được tạo và email xác nhận đã được gửi.'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Đã xảy ra lỗi khi gửi email: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
        titleString: 'Checkout',
        child: SingleChildScrollView(
          child: Consumer<HotelBookingViewModel>(
            builder: (context, data, _){
              return Column(
                children: [
                  Row(
                    children: listSteps
                        .map((e) => ItemStepCheckOut(
                      step: listSteps.indexOf(e) + 1,
                      stepName: e,
                      isEnd: listSteps.indexOf(e) == listSteps.length - 1,
                      isCheck: listSteps.indexOf(e) == 2,
                    ))
                        .toList(),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
                      color: Colors.grey.shade50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'VN',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Ha Noi',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: 25,
                          color: Colors.black,
                        ),
                        Icon(
                          FontAwesomeIcons.plane,
                          size: 30,
                        ),
                        Container(
                          height: 1,
                          width: 25,
                          color: Colors.black,
                        ),
                        Column(
                          children: const [
                            Text(
                              'SBY',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Surabaya',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  DashLineWidget(
                    color: Colors.black45,
                  ),
                  InvoidWidget(
                    airline: "${data.flight?.to} airline",
                    passenger: Provider.of<UserViewModel>(context, listen: false)
                        .user
                        ?.userName
                        .toString() ??
                        'nguyen van a',
                    logo: data.flight?.airlineLogo ?? AssetHelper.logoAir,
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
                      color: Colors.grey.shade50,
                    ),
                    child: Column(
                      children: [
                        _rowCustom('1 Passenger', '\$215'),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        _rowCustom('Insurance', '-'),
                        DashLineWidget(
                          color: Colors.black45,
                        ),
                        _rowCustom('Total', '\$215', bold: true),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(kDefaultPadding)),
                      color: Colors.grey.shade50,
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Image.asset(AssetHelper.cardBank)),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Credit / Debit Card',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Master Card',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                print("---------- da an");
                              },
                              child: Text(
                                'Change',
                                style: TextStyle(color: Colors.deepPurpleAccent),
                              )),
                        )
                      ],
                    ),
                  ),
                  ButtonWidget(
                    title: 'Pay now',
                    isign: showDialog,
                    ontap: () async {
                      setState(() {
                        showDialog = true;
                      });
                      await createInvoice(context, Provider.of<UserViewModel>(context, listen: false).user!.email.toString());
                      setState(() {
                        showDialog = false;
                      });
                      Navigator.of(context)
                          .pushNamed(MainApp.routeName);
                    },
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                ],
              );
            },
          ),
        ));
  }

  Widget _rowCustom(String left, String right, {bool? bold}) {
    return Row(
      children: [
        Text(
          left,
          style: TextStyle(
              fontSize: 15,
              fontWeight: (bold != null) ? FontWeight.bold : FontWeight.normal),
        ),
        Spacer(),
        Text(
          right,
          style: TextStyle(
              fontSize: 15,
              fontWeight: (bold != null) ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
