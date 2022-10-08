import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class TimeController extends GetxController {
  //ToDo:

  RxString fromTime = "${DateTime.now().hour}:${DateTime.now().minute}".obs;
  RxString toTime = "${DateTime.now().hour}:${DateTime.now().minute}".obs;

  void openTimePickerSheet(BuildContext context, String toOrFrom) async {
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
      toOrFrom = "${result.hour}:${result.minute}";
      print(toOrFrom);
    }
  }
}
