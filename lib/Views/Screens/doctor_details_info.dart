import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_guide/Controllers/show_doctor_info_controller.dart';
import 'package:doctors_guide/Views/widgets/doctor_info_card.dart';
import 'package:doctors_guide/Views/widgets/doctor_location.dart';
import 'package:doctors_guide/Views/widgets/loading_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> doctorInfo =
              snapshot.data!.docs;

          return showDoctorInfo.isLoading
              ? const LoadingWidget()
              : ListView.builder(
                  itemCount: doctorInfo.length,
                  itemBuilder: (context, index) {
                    List splitString = doctorInfo[index]['latLong'].split(',');
                    LatLng latAndLng = LatLng(double.parse(splitString[0]),
                        double.parse(splitString[1]));
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
                              "working time title :".tr,
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                  doctorInfo[index]['workingDays'].join(' , '),
                                ),
                                Text(
                                  "متوفر من الساعة ${doctorInfo[index]['fromTime']} الى الساعة"
                                  " ${doctorInfo[index]['toTime']}",
                                ),
                              ],
                            ),
                          ),
                        ),
                        DoctorLocationMap(
                          latLong: latAndLng,
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
          : GestureDetector(
              onTap: () async {
                Uri phoneNum = Uri.parse("tel:0$phoneNumber");
                if (await canLaunchUrl(phoneNum)) {
                  await launchUrl(phoneNum);
                } else {
                  throw 'Could not launch $phoneNum';
                }
              },
              child: Container(
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
                    '0${phoneNumber.toString()}',
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
            ),
    );
  }
}
