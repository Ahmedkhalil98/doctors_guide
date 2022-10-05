import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/Iraq_Cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  var loginController = Get.put(LogInDoctorController());

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
                  height: 310.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/doctorimg.jpg"))),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 290.h,
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
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 15.h, bottom: 10.h),
                                child: Text(
                                  "اختر محافظتك للبدء :",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: kgrayColor,
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      color: kgrayColor.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  height: 40.h,
                                  child: Obx(
                                    () => DropdownButton(
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        value:
                                            loginController.dropdownvalue.value,
                                        items: iraqCities
                                            .map((e) => DropdownMenuItem(
                                                value: e, child: Text('$e')))
                                            .toList(),
                                        onChanged: (newvalue) {
                                          loginController
                                              .setSelected(newvalue.toString());
                                        }),
                                  )),
                              MyButtonWidget(
                                btntitle: "دخول",
                                color: kPrimaryColor,
                              ),
                              MyButtonWidget(
                                btntitle: "الدخول كطبيب",
                                color: kSecondColor,
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
