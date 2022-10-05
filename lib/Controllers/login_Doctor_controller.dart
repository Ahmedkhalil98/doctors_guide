import 'package:get/get.dart';

class LogInDoctorController extends GetxController {
  RxString dropdownCity = 'بغداد'.obs;
  RxString dropdownSpecialty = 'الطب العام'.obs;

  void setSelectedCity(String value) {
    dropdownCity.value = value;
  }

  void setSelectedSpecialty(String value) {
    dropdownSpecialty.value = value;
  }
}
