import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_guide/Controllers/show_doctor_info_controller.dart';
import 'package:doctors_guide/Views/Screens/doctor_details_info.dart';
import 'package:doctors_guide/Views/widgets/drawer_Widgets.dart';
import 'package:doctors_guide/Views/widgets/loading_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/iraq_cities_and_specialties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final showDoctorInfo = Get.put(ShowDInfo());
  Random colorIndex = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidgets(),
        appBar: AppBar(
          title: Text(
            'home-page-title'.tr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
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
                            underline: const SizedBox(),
                            value: showDoctorInfo.dropdownCity.value,
                            items: iraq_cities
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      '$e',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (newvalue) {
                              showDoctorInfo
                                  .setSelectedCity(newvalue.toString());
                            }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
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
                            underline: const SizedBox(),
                            value: showDoctorInfo.dropdownSpecialty.value,
                            items: specialties
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      '$e',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (newvalue) {
                              showDoctorInfo
                                  .setSelectedSpecialty(newvalue.toString());
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<ShowDInfo>(
                builder: (controller) {
                  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    future: showDoctorInfo.showDoctors(),
                    builder: (context, snapshot) {
                      showDoctorInfo.isLoading = true;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      }
                      if (snapshot.data == null) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 110.h,
                              ),
                              SizedBox(
                                  width: 300.w,
                                  height: 200.h,
                                  child: Lottie.asset("images/empty.json")),
                            ],
                          ),
                        );
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 110.h,
                              ),
                              SizedBox(
                                  width: 300.w,
                                  height: 200.h,
                                  child: Lottie.asset("images/empty.json")),
                              Text(
                                "النتيجة فارغة",
                                style: TextStyle(
                                  color: kGrayColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          doctors = snapshot.data!.docs;
                      showDoctorInfo.isLoading = false;

                      return showDoctorInfo.isLoading
                          ? const LoadingWidget()
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: doctors.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 80.h,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Get.to(DoctorDetailsInfo(
                                            phoneNumber: doctors[index]
                                                ['phoneNumber'],
                                            doctorName: doctors[index]
                                                ['fullName'],
                                          ));
                                        },
                                        leading: Container(
                                          width: 50.w,
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    doctors[index]['imageUrl'],
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        subtitle:
                                            Text(doctors[index]['specialty']),
                                        trailing: Container(
                                          padding: EdgeInsets.all(8.w),
                                          decoration: BoxDecoration(
                                            color: cardColors[
                                                colorIndex.nextInt(17)],
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            doctors[index]['city'],
                                          ),
                                        ),
                                        title: Text(
                                          doctors[index]['fullName'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
