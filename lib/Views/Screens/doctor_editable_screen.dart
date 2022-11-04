import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_guide/Controllers/editable_controller.dart';
import 'package:doctors_guide/Controllers/location_controller.dart';
import 'package:doctors_guide/Controllers/show_doctor_info_controller.dart';
import 'package:doctors_guide/Controllers/time_Controlller.dart';
import 'package:doctors_guide/Views/screens/register_doctor_info.dart';
import 'package:doctors_guide/Views/screens/register_doctor_more_info.dart';
import 'package:doctors_guide/Views/widgets/text_field_widget.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/Views/widgets/loading_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/iraq_cities_and_specialties.dart';
import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/main.dart';
import 'package:doctors_guide/utils/valid_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';

class DoctorEditableScreen extends StatelessWidget {
  DoctorEditableScreen({Key? key}) : super(key: key);
  final timeController = Get.put(TimeController(), permanent: true);
  final mapController = Get.put(LocationController());
  final loginController = Get.put(LogInDoctorController());
  final showDoctorInfo = Get.put(ShowDInfo());
  final editableController = Get.put(Editable());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'تعديل المعلومات الشخصية ',
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GestureDetector(
              onTap: () {
                if (editableController.formKey.currentState!.validate()) {
                  editableController.pressSaveChange();
                } else {}
              },
              child: MyButtonWidget(btntitle: " حفظ", color: kPrimaryColor)),
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: showDoctorInfo.doctorDetails(
              int.parse("${localStorage!.getString('doctorPhoneNumber')}")),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            }
            //print(snapshot.data.);
            List<QueryDocumentSnapshot<Map<String, dynamic>>> doctorInfo =
                snapshot.data!.docs;
            return ListView.builder(
              itemCount: doctorInfo.length,
              itemBuilder: (context, index) {
                editableController.setValueFun(doctorInfo, index);

                editableController.userId = doctorInfo[index].id;

                return SingleChildScrollView(
                    reverse: true,
                    child: Form(
                      key: editableController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextFieldWidget(
                            valid: (value) {
                              return validInput(value!, 200, "name");
                            },
                            controller: loginController.fullName,
                            hint: "اسم الطيب",
                            title: "أدخل أسم الثلاثي للطبيب :",
                          ),
                          textFieldTitle(subTitle: "المحافظة:"),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: kGrayColor.withOpacity(0.8),
                                  width: 1.w,
                                ),
                              ),
                              height: 50.h,
                              child: Obx(
                                () => DropdownButton(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    value: loginController.dropdownCity.value,
                                    items: iraq_cities
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              '$e',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (newvalue) {
                                      loginController
                                          .setSelectedCity(newvalue.toString());
                                    }),
                              )),
                          textFieldTitle(subTitle: "التخصص:"),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: kGrayColor.withOpacity(0.8),
                                  width: 1.w,
                                ),
                              ),
                              height: 50.h,
                              child: Obx(
                                () => DropdownButton(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    value:
                                        loginController.dropdownSpecialty.value,
                                    items: specialties
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              '$e',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (newvalue) {
                                      loginController.setSelectedSpecialty(
                                          newvalue.toString());
                                    }),
                              )),
                          MyTextFieldWidget(
                            valid: (value) {
                              return validInput(value!, 11, "phone");
                            },
                            controller: loginController.phoneNumber,
                            hint: "075XXXXXXXX",
                            title: "رقم العيادة",
                            
                          ),
                          MyTextFieldWidget(
                            valid: (value) {
                              return validInput(value!, 50, "price");
                            },
                            controller: loginController.price,
                            hint: "ادخل مبلغ بالدينار",
                            title: "سعر معاينة",
                            helpText: "IQD",
                          ),
                          textFieldTitle(subTitle: "قم برفع صورتك الشخصية :"),
                          Container(
                            height: 50.h,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(width: 1.w, color: kGrayColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 250.w,
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: GetBuilder<Editable>(
                                      builder: (imageController) => Text(
                                        loginController.image == null
                                            ? "لم يتم رفع أي صورة بعد"
                                            : basename(
                                                editableController.image!.path),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: kGrayColor.withOpacity(0.6),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    editableController.uploadImage();
                                  },
                                  child: SizedBox(
                                      width: 50.w,
                                      height: 50.h,
                                      child: Image.asset(
                                          "images/uploadImage.png")),
                                ),
                              ],
                            ),
                          ),
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
                                        selected: editableController
                                            .selectedWorkingDays
                                            .contains(e),
                                      ))
                                  .toList(),
                              highlightColor: kPrimaryColor,
                              onChange: (allSelectedItems, selectedItem) {
                                loginController.workingDays = allSelectedItems;
                              },
                            ),
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
                                        timeController
                                            .openTimePicker4FromTime(context);
                                      },
                                      child: timeTextField(
                                          context: context,
                                          suTitle: "من",
                                          time: timeController.fromTime)),
                                  GestureDetector(
                                      onTap: () {
                                        timeController
                                            .openTimePicker4ToTime(context);
                                      },
                                      child: timeTextField(
                                          context: context,
                                          suTitle: "الى",
                                          time: timeController.toTime
                                              .toString())),
                                ],
                              ),
                            ),
                          ),
                          MyTextFieldWidget(
                            valid: (value) {
                              return validInput(value!, 200, "address");
                            },
                            controller: loginController.address,
                            hint: "اسم منطقة,اسم شارع,اسم مشفى او مجمع",
                            title: "أدخل العنوان العيادة :",
                          ),
                          textFieldTitle(
                              subTitle: "قم بتحديد موقع العيادة على الخريطة:"),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 5.h),
                              height: 230.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                              ),
                              child: GetBuilder<Editable>(
                                  builder: (mapController) {
                                if (editableController.kGooglePlex == null) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                Set<Marker> placeMarker = {
                                  Marker(
                                    draggable: true,
                                    markerId: const MarkerId("1"),
                                    position: editableController.latAndLng,
                                  ),
                                };

                                return GoogleMap(
                                    markers: placeMarker,
                                    initialCameraPosition: CameraPosition(
                                      target: editableController.latAndLng,
                                      zoom: 14.0,
                                    ),
                                    onTap: (newLatLng) {
                                      editableController.onMapTap(newLatLng);
                                    },
                                    myLocationEnabled: true,
                                    zoomControlsEnabled: true,
                                    mapType: MapType.normal,
                                    onMapCreated: (GoogleMapController c) {
                                      mapController.controller.complete(c);
                                    });
                              })),
                          SizedBox(
                            height: 90.h,
                          )
                        ],
                      ),
                    ));
              },
            );
          },
        ));
  }
}
