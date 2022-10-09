import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class TimeController extends GetxController {
  //ToDo:

  String fromTime = "${DateTime.now().hour}:${DateTime.now().minute}";
  String toTime = "${DateTime.now().hour}:${DateTime.now().minute}";

  void openTimePicker4FromTime(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'حدد الوقت',
        minuteTitle: 'دقيقة',
        hourTitle: 'ساعة',
        saveButtonText: 'حفظ',
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
        sheetTitle: 'حدد الوقت',
        minuteTitle: 'دقيقة',
        hourTitle: 'ساعة',
        saveButtonText: 'حفظ',
      ),
    );
    if (result != null) {
      toTime = "${result.hour}:${result.minute}";
      update();
    }
  }
}
