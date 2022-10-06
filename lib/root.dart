<<<<<<< HEAD
import 'package:doctors_guide/Views/Screens/home_screen.dart';
=======
import 'package:doctors_guide/Views/Screens/Register_doctor_info.dart';
>>>>>>> 697cd3582c9e9f0ce8129b39e75c9c3464203508
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
        //home: IntroScreen(),
=======
        home: RegisterDoctorInfo(),
>>>>>>> 697cd3582c9e9f0ce8129b39e75c9c3464203508

        //  home: HomeScreen(),
        theme: myThemeData(),
        locale: const Locale(
          "ar",
        ),
      );
    });
  }
}
