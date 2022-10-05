import 'package:get/get.dart';

class LogInDoctorController extends GetxController {
  RxString dropdownvalue = 'بغداد'.obs;

  void setSelected(String value) {
    dropdownvalue.value = value;
  }
}
