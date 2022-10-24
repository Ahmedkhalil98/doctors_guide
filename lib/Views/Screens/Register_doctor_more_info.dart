import 'package:doctors_guide/Controllers/location_controller.dart';
import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Controllers/time_Controlller.dart';
import 'package:doctors_guide/Views/Screens/Home_Screen.dart';
import 'package:doctors_guide/Views/Screens/Register_doctor_info.dart';
import 'package:doctors_guide/Views/widgets/Text_field_widget.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/Iraq_Cities_and_Specialties.dart';
import 'package:doctors_guide/main.dart';
import 'package:doctors_guide/utils/valid_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisterDoctorLocation extends StatelessWidget {
  RegisterDoctorLocation({Key? key}) : super(key: key);

  final logInDoctor = Get.put(LogInDoctorController(), permanent: true);
  final timeController = Get.put(TimeController(), permanent: true);
  final mapController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الدخول كطبيب",
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GestureDetector(
            onTap: () {
              if (logInDoctor.addressFormKey.currentState!.validate()) {
                logInDoctor.addNewDoctorData(
                    fullName: logInDoctor.fullName.text,
                    city: logInDoctor.dropdownCity.toString(),
                    specialty: logInDoctor.dropdownSpecialty.toString(),
                    previewPrice: int.parse(logInDoctor.price.text),
                    phoneNumber: int.parse(logInDoctor.phoneNumber.text),
                    workingDays: logInDoctor.workingDays,
                    fromTime: timeController.fromTime,
                    toTime: timeController.toTime,
                    address: logInDoctor.address.text,
                    latLong:
                        "${mapController.latLng.latitude.toString()},${mapController.latLng.longitude.toString()}");
                localStorage!.setString("role", "admin");
                Get.to(() => HomeScreen());
              } else {}
            },
            child: MyButtonWidget(btntitle: "حفظ", color: kPrimaryColor)),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: logInDoctor.addressFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitle(subTitle: "أيام الدوام :"),
              Container(
                height: 80.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.all(3.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: MultiSelectContainer(
                    itemsDecoration: MultiSelectDecorations(
                        selectedDecoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(40.r),
                    )),
                    items: weekDays
                        .map((e) => MultiSelectCard(
                              value: e,
                              label: e,
                            ))
                        .toList(),
                    highlightColor: kPrimaryColor,
                    onChange: (allSelectedItems, selectedItem) {
                      logInDoctor.workingDays = allSelectedItems;
                    }),
              ),
              GetBuilder<TimeController>(
                builder: (timeController) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  width: double.infinity,
                  height: 60.h,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            timeController.openTimePicker4FromTime(context);
                          },
                          child: timeTextField(
                              context: context,
                              suTitle: "من",
                              time: timeController.fromTime)),
                      GestureDetector(
                          onTap: () {
                            timeController.openTimePicker4ToTime(context);
                          },
                          child: timeTextField(
                              context: context,
                              suTitle: "الى",
                              time: timeController.toTime.toString())),
                    ],
                  ),
                ),
              ),
              MyTextFieldWidget(
                valid: (value) {
                  return validInput(value!, 200, "address");
                },
                controller: logInDoctor.address,
                hint: "اسم منطقة,اسم شارع,اسم مشفى او مجمع",
                title: "أدخل العنوان العيادة :",
              ),
              textFieldTitle(subTitle: "قم بتحديد موقع العيادة على الخريطة:"),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  height: 230.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor,
                    ),
                  ),
                  child: GetBuilder<LocationController>(
                      init: LocationController(),
                      builder: (mapController) {
                        if (mapController.kGooglePlex == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return GoogleMap(
                            markers: mapController.currentmarker,
                            initialCameraPosition: CameraPosition(
                              target: mapController.latLng,
                              zoom: 14.0,
                            ),
                            onTap: (latlng) {
                              mapController.onMapTap(latlng);
                            },
                            myLocationEnabled: true,
                            zoomControlsEnabled: true,
                            mapType: MapType.normal,
                            onMapCreated: (GoogleMapController c) {
                              mapController.controller.complete(c);
                            });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

Widget timeTextField({
  required BuildContext context,
  required String suTitle,
  required String time,
}) {
  return Row(
    children: [
      textFieldTitle(subTitle: suTitle),
      Container(
        alignment: Alignment.center,
        width: 120.w,
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: kGrayColor.withOpacity(0.9),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.schedule,
              color: kGrayColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    ],
  );
}
