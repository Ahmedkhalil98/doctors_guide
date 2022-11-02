import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Views/Screens/home_screen.dart';
import 'package:doctors_guide/Views/Screens/login_as_doctor.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LogInDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 400.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/doctorimg.jpg"))),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 350.h,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "مرحبا بك في طبيبي",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //ToDo:
                                  localStorage!.setString("role", "user");
                                  Get.to(() => HomeScreen());
                                },
                                child: MyButtonWidget(
                                  btntitle: "Entry".tr,
                                  color: kPrimaryColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => LogInAsADoctor());
                                },
                                child: MyButtonWidget(
                                  btntitle: "Log in as a doctor".tr,
                                  color: kSecondColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
