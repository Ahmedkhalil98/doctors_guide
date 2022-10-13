import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class TimeController extends GetxController {
  //ToDo:

  String fromTime = "0:0";
  String toTime = "0:0";

  void openTimePicker4FromTime(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'من وقت :',
        minuteTitle: 'دقيقة',
        hourTitle: 'ساعة',
        saveButtonText: 'حفظ',
        saveButtonColor: kPrimaryColor,
        sheetCloseIconColor: kBlackColor,
        twoDigit: true,
        minuteTitleStyle: TextStyle(
          color: kBlackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        hourTitleStyle: TextStyle(
          color: kBlackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        wheelNumberSelectedStyle: TextStyle(
          color: kPrimaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    if (result != null) {
      fromTime = "${result.hour}:${result.minute}";
      update();
    }
  }

  void openTimePicker4ToTime(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'الى وقت :',
        minuteTitle: 'دقيقة',
        hourTitle: 'ساعة',
        saveButtonText: 'حفظ',
        saveButtonColor: kPrimaryColor,
        sheetCloseIconColor: kBlackColor,
        twoDigit: true,
        minuteTitleStyle: TextStyle(
          color: kBlackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        hourTitleStyle: TextStyle(
          color: kBlackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        wheelNumberSelectedStyle: TextStyle(
          color: kPrimaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
    if (result != null) {
      toTime = "${result.hour}:${result.minute}";
      update();
    }
  }
}
