import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShowDInfo extends GetxController {
  bool isLoading = false;
  RxString dropdownCity = 'بغداد'.obs;
  RxString dropdownSpecialty = 'الطب العام'.obs;

  bool isCityChange = false;
  bool isSpecialtyChange = false;

  void setSelectedCity(String value) {
    dropdownCity.value = value;
    isCityChange = true;
    update();
  }

  void setSelectedSpecialty(String value) {
    dropdownSpecialty.value = value;
    isSpecialtyChange = true;
    update();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> showDoctors() {
    if (isCityChange) {
      isCityChange = false;
      return FirebaseFirestore.instance
          .collection("DoctorInformation")
          .where("city", isEqualTo: dropdownCity.value)
          .get();
    }
    if (isSpecialtyChange) {
      isSpecialtyChange = false;
      return FirebaseFirestore.instance
          .collection("DoctorInformation")
          .where("specialty", isEqualTo: dropdownSpecialty.value)
          .get();
    }
    return FirebaseFirestore.instance
        .collection("DoctorInformation")
        //.where("a", isEqualTo: 2)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> doctorDetails(int phoneNumber) {
    return FirebaseFirestore.instance
        .collection("DoctorInformation")
        .where("phoneNumber", isEqualTo: phoneNumber)
        .get();
  }
}
