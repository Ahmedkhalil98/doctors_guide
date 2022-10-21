import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//color
// 8ad8da
// d17d2f
// 080d10   black
class DoctorTheme {
  static ThemeData customLight = ThemeData.light().copyWith(
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
        fontSize: 18.sp,
        color: kBlackColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: Colors.black.withOpacity(0.8),
      ),
    ),
  );
  static ThemeData customDark = ThemeData.dark().copyWith(
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
        fontSize: 18.sp,
        color: kWhiteColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: kWhiteColor,
      ),
    ),
  );
  void changeDoctorTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(DoctorTheme.customLight);
    } else {
      Get.changeTheme(DoctorTheme.customDark);
    }
  }
}
