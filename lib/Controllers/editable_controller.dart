import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Controllers/time_Controlller.dart';
import 'package:doctors_guide/Models/doctor_info_Model.dart';
import 'package:doctors_guide/Views/Screens/home_screen.dart';
import 'package:doctors_guide/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Editable extends GetxController {
  late LatLng latAndLng;
  late List selectedWorkingDays;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController> controller = Completer();
  late String imageUrl;
  late String imageName;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String userId;
  XFile? image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  final loginController = Get.put(LogInDoctorController());
  final timeController = Get.put(TimeController());
  void setValueFun(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> doctorInfo, int index) {
    // isLoading.value = true;
    loginController.fullName.text = doctorInfo[index]['fullName'];
    loginController.phoneNumber.text =
        doctorInfo[index]['phoneNumber'].toString();
    imageName = doctorInfo[index]['phoneNumber'].toString();
    imageUrl = doctorInfo[index]['imageUrl'];

    loginController.price.text = doctorInfo[index]['previewPrice'].toString();
    loginController.address.text = doctorInfo[index]['address'];
    loginController.dropdownCity.value = doctorInfo[index]['city'];
    loginController.dropdownSpecialty.value = doctorInfo[index]['specialty'];
    timeController.fromTime = doctorInfo[index]['fromTime'];
    timeController.toTime = doctorInfo[index]['toTime'];
    List splitString = doctorInfo[index]['latLong'].split(',');

    latAndLng =
        LatLng(double.parse(splitString[0]), double.parse(splitString[1]));
    selectedWorkingDays = doctorInfo[index]['workingDays'];
    getposition();
    // isLoading.value = false;
  }

  Future getPermission() async {
    bool services;
    LocationPermission permission;
    services = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      getposition();
    } else {
      permission = await Geolocator.requestPermission();
      getposition();
    }
  }

  Future getposition() async {
    kGooglePlex = CameraPosition(
      target: latAndLng,
      zoom: 14.0,
    );
    update();
  }

  Set<Marker> placeMarker = {
    const Marker(
      draggable: true,
      markerId: MarkerId("1"),
      // position: latAndLng,
    ),
  };

  onMapTap(LatLng newLatLng) {
    placeMarker.remove(const Marker(markerId: MarkerId("1")));
    placeMarker.add(Marker(markerId: const MarkerId("1"), position: newLatLng));
    latAndLng = newLatLng;

    update();
  }

  @override
  void onInit() {
    getPermission();
    super.onInit();
  }

  uploadImage() async {
    final imagePiker = ImagePicker();
    image = await imagePiker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    update();
  }

  pressSaveChange() async {
    isLoading.value = true;
    if (image == null) {
      DoctorInfoModel doctorData = DoctorInfoModel(
        fullName: loginController.fullName.text,
        city: loginController.dropdownCity.toString(),
        specialty: loginController.dropdownSpecialty.toString(),
        previewPrice: int.parse(loginController.price.text),
        phoneNumber: int.parse(loginController.phoneNumber.text),
        workingDays: loginController.workingDays,
        fromTime: timeController.fromTime,
        toTime: timeController.toTime,
        address: loginController.address.text,
        latLong:
            "${latAndLng.latitude.toString()},${latAndLng.longitude.toString()}",
        imageUrl: imageUrl,
        doctorCode: tempStorage!.getString('doctorCode')!,
      );

      _firestore
          .collection("DoctorInformation")
          .doc(userId)
          .update(doctorData.toMap());
    } else {
      final storageRef = FirebaseStorage.instance.ref();
      final desertRef = storageRef.child("DoctorsImages/$imageName");
      await desertRef.delete();
      File file = File(image!.path);
      var refStorage = FirebaseStorage.instance
          .ref("DoctorsImages/${loginController.phoneNumber.text}");
      await refStorage.putFile(file);
      refStorage.getDownloadURL().then((newImageUrl) {
        DoctorInfoModel doctorData = DoctorInfoModel(
          fullName: loginController.fullName.text,
          city: loginController.dropdownCity.toString(),
          specialty: loginController.dropdownSpecialty.toString(),
          previewPrice: int.parse(loginController.price.text),
          phoneNumber: int.parse(loginController.phoneNumber.text),
          workingDays: loginController.workingDays,
          fromTime: timeController.fromTime,
          toTime: timeController.toTime,
          address: loginController.address.text,
          latLong:
              "${latAndLng.latitude.toString()},${latAndLng.longitude.toString()}",
          imageUrl: newImageUrl,
          doctorCode: tempStorage!.getString('doctorCode')!,
        );
        localStorage!.setString("doctorImageUrl", newImageUrl);
        _firestore
            .collection("DoctorInformation")
            .doc(userId)
            .update(doctorData.toMap());
      });
    }

    localStorage!.setString("doctorName", loginController.fullName.text);
    localStorage!
        .setString("doctorPhoneNumber", loginController.phoneNumber.text);
    isLoading.value = false;
    Get.to(() => HomeScreen());

    loginController.phoneNumber.clear();
    loginController.fullName.clear();
    loginController.address.clear();
    loginController.price.clear();
  }
}
