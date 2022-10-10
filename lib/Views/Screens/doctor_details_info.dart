import 'package:doctors_guide/Controllers/time_Controlller.dart';
import 'package:doctors_guide/Views/widgets/doctor_info_card.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorDetailsInfo extends StatelessWidget {
  DoctorDetailsInfo({super.key});
  var timeController = Get.put(TimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تخصص"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            width: 150.w,
            height: 150.h,
            child: const CircleAvatar(
              backgroundColor: Colors.red,
              // backgroundImage: AssetImage(""),
            ),
          ),
          const DoctorInfoCard(titleVale: "الدكتور علي محمود", title: "الأسم"),
          const DoctorInfoCard(titleVale: "جراحة العيون", title: "التخصص"),
          const DoctorInfoCard(titleVale: "دهوك", title: "المحافظة"),
          const DoctorInfoCard(titleVale: "دهوك,سميل و...", title: "العنوان"),
          const DoctorInfoCard(titleVale: "15000 دينار", title: "سعر المعاينة"),
          const DoctorInfoCard(
              titleVale: "حاصل على شهادة عدد", title: "تفاصيل "),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            color: kPrimaryColor,
            child: ListTile(
              leading: const Text(
                "اوقات الدوام :",
              ),
              title: Column(
                children: [
                  Text(
                    "السبت ,الاحد ,الاثنين,الثلاثاء,الاربعاء,الخميس",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "متوفر من الساعة ${timeController.fromTime} الى الساعة"
                    " ${timeController.toTime}",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: ListTile(
              title: Center(
                  child: Text(
                textDirection: TextDirection.ltr,
                "0750 456 4596",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: kWhiteColor,
                ),
              )),
              trailing: Icon(
                Icons.phone,
                size: 25.h,
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.local_phone_outlined),
      // ),
    );
  }
}
