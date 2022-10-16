import 'package:doctors_guide/Models/doctor_info_Model.dart';
import 'package:doctors_guide/Views/Screens/Register_doctor_more_info.dart';
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
  GlobalKey<FormState> doctorFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
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
    required String latLong,
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
      address: address,
      latLong: latLong,
    );

    return _firestore
        .collection("DoctorInformation")
        .add(doctorData.toMap())
        .then((value) => print("New doctor add"))
        .catchError((e) => print("Failed to add and Error : $e ?"));
  }

  nextForm() {
    final formData = doctorFormKey.currentState;
    if (formData!.validate()) {
      Get.to(RegisterDoctorLocation());
    } else {}
  }
}
