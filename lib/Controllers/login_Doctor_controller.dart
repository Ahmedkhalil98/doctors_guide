import 'package:doctors_guide/Models/doctor_info_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogInDoctorController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController code = TextEditingController();
  RxString dropdownCity = 'بغداد'.obs;
  RxString dropdownSpecialty = 'الطب العام'.obs;
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController address = TextEditingController();
  List workingDays = [];

  void setSelectedCity(String value) {
    dropdownCity.value = value;
  }

  void setSelectedSpecialty(String value) {
    dropdownSpecialty.value = value;
  }

  Future<void> addNewDoctorData({
    required String fullName,
    required String city,
    required String specialty,
    required int previewPrice,
    required int phoneNumber,
    required List workingDays,
    required String fromTime,
    required String toTime,
    required String address,
  }) {
    DoctorInfoModel doctorData = DoctorInfoModel(
        fullName: fullName,
        city: city,
        specialty: specialty,
        previewPrice: previewPrice,
        phoneNumber: phoneNumber,
        workingDays: workingDays,
        fromTime: fromTime,
        toTime: toTime,
        address: address);

    return _firestore
        .collection("DoctorInformation")
        .add(doctorData.toMap())
        .then((value) => print("New doctor add"))
        .catchError((e) => print("Failed to add and Error : $e ?"));
  }
}
