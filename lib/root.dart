import 'package:doctors_guide/Views/Screens/home_screen.dart';
import 'package:doctors_guide/Views/Screens/register_doctor_info.dart';
import 'package:doctors_guide/Views/Screens/intro_Screen.dart';
import 'package:doctors_guide/Views/Screens/login_as_doctor.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:doctors_guide/locale/locale.dart';
import 'package:doctors_guide/locale/locale_controller.dart';
import 'package:doctors_guide/main.dart';
import 'package:doctors_guide/utils/middlewar_function.dart';
import 'package:doctors_guide/utils/my_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguagesController());

    return ScreenUtilInit(builder: (context, child) {
      final themeConroller = Get.put(DoctorTheme());
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: const LoadingWidget(),

        initialRoute: '/',
        getPages: [
          GetPage(
            name: "/",
            page: () => IntroScreen(),
            middlewares: [LoginMiddleWarFun()],
          ),
          GetPage(name: "/homeScreen", page: () => HomeScreen()),
          GetPage(
              name: "/loginAsDoctor",
              page: () => LogInAsADoctor(),
              middlewares: [LoginMiddleWarFun()]),
          GetPage(
            name: "/adminInRegister",
            page: () => RegisterDoctorInfo(),
          ),
        ],
        initialBinding: MyBindings(),
        theme: localStorage!.getBool('doctorTheme') == true
            ? themeConroller.customLight
            : themeConroller.customDark,
        locale: controller.initialLanguage,
        translations: DoctorLocale(),
      );
    });
  }
}
