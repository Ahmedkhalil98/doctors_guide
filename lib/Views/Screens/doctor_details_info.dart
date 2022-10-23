import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_guide/Controllers/show_doctor_info_controller.dart';
import 'package:doctors_guide/Views/widgets/doctor_info_card.dart';
import 'package:doctors_guide/Views/widgets/doctor_location.dart';
import 'package:doctors_guide/Views/widgets/loading_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorDetailsInfo extends StatelessWidget {
  DoctorDetailsInfo(
      {super.key, required this.phoneNumber, required this.doctorName});
  int phoneNumber;
  String doctorName;
  @override
  final showDoctorInfo = Get.put(ShowDInfo());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          doctorName,
        ),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: showDoctorInfo.doctorDetails(phoneNumber),
        builder: (context, snapshot) {
          showDoctorInfo.isLoading = true;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> doctorInfo =
              snapshot.data!.docs;
          showDoctorInfo.isLoading = false;

          return showDoctorInfo.isLoading
              ? const LoadingWidget()
              : ListView.builder(
                  itemCount: doctorInfo.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: 150.w,
                          height: 140.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              image: DecorationImage(
                                image:
                                    NetworkImage(doctorInfo[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                              border:
                                  Border.all(width: 1, color: kPrimaryColor)),
                        ),
                        DoctorInfoCard(
                            titleVale: doctorInfo[index]['fullName'],
                            title: "الأسم"),
                        DoctorInfoCard(
                            titleVale: doctorInfo[index]['specialty'],
                            title: "التخصص"),
                        DoctorInfoCard(
                            titleVale: doctorInfo[index]['city'],
                            title: "المحافظة"),
                        DoctorInfoCard(
                            titleVale: doctorInfo[index]['address'],
                            title: "العنوان"),
                        DoctorInfoCard(
                            titleVale:
                                "${doctorInfo[index]['previewPrice'].toString()} دينار",
                            title: "سعر المعاينة"),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          color: kPrimaryColor,
                          child: ListTile(
                            title: Text(
                              "اوقات الدوام :",
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                  doctorInfo[index]['workingDays'].join(' , '),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: kBlackColor,
                                  ),
                                ),
                                Text(
                                  "متوفر من الساعة ${doctorInfo[index]['fromTime']} الى الساعة"
                                  " ${doctorInfo[index]['toTime']}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: kBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DoctorLocationMap(
                          latLong: doctorInfo[index]['latLong'],
                          doctorName: doctorInfo[index]['fullName'],
                        ),
                      ],
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: showDoctorInfo.isLoading
          ? Container()
          : Container(
              width: MediaQuery.of(context).size.width * 90,
              height: MediaQuery.of(context).size.height * 0.08,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: kSecondColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: ListTile(
                title: Center(
                    child: Text(
                  textDirection: TextDirection.ltr,
                  phoneNumber.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kWhiteColor,
                  ),
                )),
                trailing: Icon(
                  Icons.phone,
                  size: 25.h,
                  color: kWhiteColor,
                ),
              ),
            ),
    );
  }
}
