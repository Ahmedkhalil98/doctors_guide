import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

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
                                height: 40.h,
                                color: kgrayColor,
                              ),
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
