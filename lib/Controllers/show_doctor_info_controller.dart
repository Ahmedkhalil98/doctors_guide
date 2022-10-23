import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShowDInfo extends GetxController {
  bool isLoading = false;
  RxString dropdownCity = 'بغداد'.obs;
  RxString dropdownSpecialty = 'الطب العام'.obs;

  void setSelectedCity(String value) {
    dropdownCity.value = value;
  }

  void setSelectedSpecialty(String value) {
    dropdownSpecialty.value = value;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> showDoctors() {
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
