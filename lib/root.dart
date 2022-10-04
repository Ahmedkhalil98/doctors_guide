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
<<<<<<< HEAD
        home: const IntroScreen(),
        locale: Get.deviceLocale,
=======
        home: HomeScreen(),
>>>>>>> 31a9b910edb6c1d0788823ce0330eb5bd4e05c3d
        theme: myThemeData(),
      );
    });
  }
}
