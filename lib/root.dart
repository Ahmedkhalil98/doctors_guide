import 'package:doctors_guide/Views/Screens/intro_Screen.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        home: IntroScreen(),
        //  locale: Get.deviceLocale,

        // home: HomeScreen(),
        theme: myThemeData(),
        locale: const Locale(
          "ar",
        ),
      );
    });
  }
}
