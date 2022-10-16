import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/utils/valid_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/Text_field_widget.dart';

class LogInAsADoctor extends StatelessWidget {
  LogInAsADoctor({Key? key}) : super(key: key);

  final loginController = Get.put(LogInDoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الدخول كطبيب",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginController.codeFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 15.h),
                height: 250.h,
                child: Lottie.asset("images/doctorCard.json"),
              ),
              MyTextFieldWidget(
                valid: (value) {
                  return validInput(value!, 15, "code");
                },
                controller: loginController.code,
                hint: "الكود",
                title: "الرجاء أدخال الكود خاص بالطبيب هنا :",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: GestureDetector(
                    onTap: () {
                      loginController.CheckCode(loginController.code.text);
                    },
                    child: MyButtonWidget(
                        btntitle: "الدخول", color: kPrimaryColor)),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  child: Text(
                    "للحصول على كود الطبيب اضغط هنا",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.telegram,
                      size: 50.h,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
