import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//color
// 8ad8da
// d17d2f
// 080d10   black

ThemeData myThemeData() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 50.h,
          titleTextStyle: TextStyle(
            color: kBlackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          )),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: kBlackColor,
        fontWeight: FontWeight.bold,
      )));
}
