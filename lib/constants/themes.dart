import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//color
// 8ad8da
// d17d2f
// 080d10   black
class DoctorTheme extends GetxController {
  bool isLightModeSelected = false;
  ThemeData customLight = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 50.h,
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Tajawal',
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: kBlackColor,
        fontFamily: 'Tajawal',
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: kBlackColor,
        fontFamily: 'Tajawal',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: kBlackColor,
        fontFamily: 'Tajawal',
      ),
    ),
  );
  ThemeData customDark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 50.h,
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Tajawal',
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: kWhiteColor,
        fontFamily: 'Tajawal',
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
        fontFamily: 'Tajawal',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
        fontFamily: 'Tajawal',
      ),
    ),
  );

  @override
  void changeDoctorTheme(bool isLightMode) {
    if (isLightMode) {
      Get.changeTheme(customDark);
      localStorage!.setBool('doctorTheme', true);
    } else {
      Get.changeTheme(customLight);
      localStorage!.setBool('doctorTheme', false);
    }
    update();
  }

  void onChangeSwitch(bool newValue) async {
    localStorage!.setBool('doctorTheme', newValue);
    changeDoctorTheme(newValue);
    update();
  }
}
