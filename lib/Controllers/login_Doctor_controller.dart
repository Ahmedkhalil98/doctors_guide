import 'dart:io';

import 'package:doctors_guide/Views/Screens/Home_Screen.dart';
import 'package:doctors_guide/Views/screens/register_doctor_info.dart';
import 'package:doctors_guide/Views/screens/register_doctor_more_info.dart';
import 'package:doctors_guide/main.dart';
import 'package:doctors_guide/models/doctor_info_Model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class LogInDoctorController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController code = TextEditingController();
  RxString dropdownCity = "بغداد".obs;
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
  var isLoading = false.obs;

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
    isLoading.value = true;
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
          doctorCode: tempStorage!.getString('doctorCode')!,
        );

        localStorage!.setString("doctorImageUrl", imageUrl);

        return _firestore
            .collection("DoctorInformation")
            .add(doctorData.toMap())
            .then((value) {
          Get.snackbar(
              "تم بنجاح", "تم اضافة معلوماتك ,قم باعادة تشغيل التطبيق ");
        }).catchError((e) {
          Get.snackbar("خطأ", "$e");
          print("==>> $e");
        });
      });
    }
    isLoading.value = false;
  }

  nextForm() {
    final formData = doctorFormKey.currentState;
    if (formData!.validate()) {
      Get.to(RegisterDoctorLocation());
    } else {}
  }

  CheckCode(String inputCode) async {
    isLoading.value = true;
    print("===>>>${isLoading.value}");
    if (codeFormKey.currentState!.validate()) {
      await _firestore
          .collection('doctorsCodes')
          .where('code', isEqualTo: inputCode)
          .get()
          .then((QuerySnapshot value) {
        if (value.docs.isEmpty) {
          Get.snackbar("خطأ", "الكود الذي ادخلته خطأ !");
          code.clear();
        } else {
          for (var element in value.docs) {
            if (element['isLogin'] == 'true') {
              FirebaseFirestore.instance
                  .collection("DoctorInformation")
                  .where("doctorCode", isEqualTo: code.text)
                  .get()
                  .then((QuerySnapshot data) {
                for (var element in data.docs) {
                  localStorage!.setString("doctorName", element['fullName']);
                  localStorage!.setString(
                      "doctorPhoneNumber", element['phoneNumber'].toString());
                  localStorage!
                      .setString("doctorImageUrl", element['imageUrl']);
                }
              });
              localStorage!.setString("role", "admin");
              Get.offAll(() => HomeScreen());
            } else if (element['isLogin'] == 'false') {
              _firestore
                  .collection("doctorsCodes")
                  .doc(element['code'])
                  .update({
                'isLogin': "true",
              });

              localStorage!.setString("role", "adminInRegister");
              Get.offAll(() => RegisterDoctorInfo());
            } else {
              Get.snackbar("خطأ", "الكود الذي ادخلته خطأ !");
            }
            tempStorage!.setString("doctorCode", code.text);
            code.clear();
          }
        }
      });
    }
    isLoading.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    code.dispose();
    fullName.dispose();
    phoneNumber.dispose();
    price.dispose();
    address.dispose();
  }
}
