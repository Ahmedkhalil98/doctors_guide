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
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: kBlackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: kBlackColor,
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
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: kWhiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
      ),
    ),
  );
  void changeDoctorTheme(bool isLightMode) {
    if (isLightMode) {
      Get.changeTheme(customDark);
      localStorage!.setBool('doctorTheme', true);
      update();
    } else {
      Get.changeTheme(customLight);
      localStorage!.setBool('doctorTheme', false);
      update();
    }
  }

  void onChangeSwitch(bool newValue) {
    if (isLightModeSelected) {
      isLightModeSelected = newValue;

      changeDoctorTheme(isLightModeSelected);
    } else {
      isLightModeSelected = newValue;

      changeDoctorTheme(isLightModeSelected);
    }
  }
}
