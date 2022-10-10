import 'dart:math';
import 'package:doctors_guide/Controllers/login_doctor_controller.dart';
import 'package:doctors_guide/Views/Screens/doctor_details_info.dart';
import 'package:doctors_guide/Views/widgets/drawer_card.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/iraq_cities_and_specialties.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var loginController = Get.put(LogInDoctorController());
  Random colorIndex = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          elevation: 1.0,
          // backgroundColor: kPrimaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                child: Text('معلومات الشخصية'),
              ),
              DrawerCard(
                  icon: Icon(Icons.app_registration), title: 'تسجيل ك طبيب'),
              DrawerCard(icon: Icon(Icons.nightlight), title: 'تغير الخلفية'),
              DrawerCard(icon: Icon(Icons.abc_outlined), title: 'حول التطبيق'),
              DrawerCard(icon: Icon(Icons.cast_connected), title: 'تواصل معنا'),
              DrawerCard(icon: Icon(Icons.nightlight), title: 'قييم التطبيق'),
              DrawerCard(icon: Icon(Icons.info_outline), title: 'معلومات عنا'),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'قائمة اطباء',
            style: titleTextStyle,
          ),
        ),
        body: SafeArea(
            child: ListView(
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
                          value: loginController.dropdownCity.value,
                          items: iraq_cities
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text('$e')))
                              .toList(),
                          onChanged: (newvalue) {
                            loginController
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
                          value: loginController.dropdownSpecialty.value,
                          items: specialties
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text('$e')))
                              .toList(),
                          onChanged: (newvalue) {
                            loginController
                                .setSelectedSpecialty(newvalue.toString());
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 110.h,
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(DoctorDetailsInfo());
                    },
                    leading: const CircleAvatar(backgroundColor: Colors.white),
                    subtitle: const Text('تخصص'),
                    trailing: const Text('سعر '),
                    title: const Text(
                      'اسم الطبيب',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: cardColors[colorIndex.nextInt(17)],
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'السليمانية',
                          style: bodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
