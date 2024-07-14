import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../res/core/constants/color_constants.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);
  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Select Date",
      child: Column(
        children: [
          SizedBox(height: kMediumPadding * 1.5,),
          SfDateRangePicker( // tao phan chon ngay
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) { // khi user chon 2 cai se gan gt tai day
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
              else{
                rangeEndDate = null;
                rangeStartDate = null;
              }
            },
          ),
          ButtonWidget(
            title: "Seclect",
            ontap: (){
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]); // se tra 1 list ve man booking
            },
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
            title: "Cancel",
            ontap: (){
              Navigator.of(context).pop([null]);
            },
            opacity: ColorPalette.primaryColor.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
