import 'dart:io';

import 'package:doctors_guide/Models/doctor_info_Model.dart';
import 'package:doctors_guide/Views/Screens/Register_doctor_info.dart';
import 'package:doctors_guide/Views/Screens/Register_doctor_more_info.dart';
import 'package:doctors_guide/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

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
  GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  List workingDays = [];
  XFile? image;
  bool isLoading = false;

  void setSelectedCity(String value) {
    dropdownCity.value = value;
  }

  void setSelectedSpecialty(String value) {
    dropdownSpecialty.value = value;
  }

  uploadImage() async {
    final imagePiker = ImagePicker();

    image = await imagePiker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    var refStorage = FirebaseStorage.instance.ref("DoctorsImages/$phoneNumber");

    update();
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
  }) async {
    DoctorInfoModel doctorData;
    if (image != null) {
      File file = File(image!.path);
      var refStorage =
          FirebaseStorage.instance.ref("DoctorsImages/$phoneNumber");
      await refStorage.putFile(file);
      refStorage.getDownloadURL().then((imageUrl) {
        doctorData = DoctorInfoModel(
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
          imageUrl: imageUrl,
        );
        return _firestore
            .collection("DoctorInformation")
            .add(doctorData.toMap())
            .then((value) => print("New doctor add"))
            .catchError((e) => print("Failed to add and Error : $e ?"));
      });
    }
  }

  nextForm() {
    final formData = doctorFormKey.currentState;
    if (formData!.validate()) {
      Get.to(RegisterDoctorLocation());
    } else {}
  }

  CheckCode(String inputCode) {
    isLoading = true;
    update();
    if (codeFormKey.currentState!.validate()) {
      _firestore
          .collection('doctorsCodes')
          .where('code', isEqualTo: inputCode)
          .get()
          .then((QuerySnapshot value) {
        if (value.docs.isEmpty) {
          Get.snackbar("خطأ", "الكود الذي ادخلته خطأ !");
          code.clear();
          print(isLoading);
        } else {
          for (var element in value.docs) {
            // print(element['code']);
            // print(element['isLogin']);
            if (element['isLogin']) {
              Get.snackbar("خطأ", "الكود الذي ادخلته خطأ !");
              code.clear();
            } else {
              _firestore
                  .collection("doctorsCodes")
                  .doc(element['code'])
                  .update({
                'isLogin': true,
              });

              localStorage!.setString("role", "adminInRegister");
              Get.to(() => RegisterDoctorInfo());
            }
          }
        }
      });
    }
    // isLoading = false;
  }
}
