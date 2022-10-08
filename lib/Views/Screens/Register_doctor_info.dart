import 'package:doctors_guide/Controllers/login_doctor_controller.dart';
import 'package:doctors_guide/Views/Screens/Register_doctor_Location.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/Views/widgets/text_field_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/iraq_cities_and_specialties.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterDoctorInfo extends StatelessWidget {
  RegisterDoctorInfo({Key? key}) : super(key: key);

  var loginController = Get.put(LogInDoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الدخول كطبيب",
          style: titleTextStyle,
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GestureDetector(
            onTap: () {
              Get.to(const RegisterDoctorLocation());
            },
            child: MyButtonWidget(btntitle: "التالي", color: kPrimaryColor)),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFieldWidget(
            hint: "اسم الطيب",
            title: "أدخل أسم الثلاثي للطبيب :",
          ),
          textFieldTitle(subTitle: "المحافظة:"),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: kgrayColor.withOpacity(0.8),
                  width: 1.w,
                ),
              ),
              height: 50.h,
              child: Obx(
                () => DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: loginController.dropdownCity.value,
                    items: iraq_cities
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text('$e')))
                        .toList(),
                    onChanged: (newvalue) {
                      loginController.setSelectedCity(newvalue.toString());
                    }),
              )),
          textFieldTitle(subTitle: "التخصص:"),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: kgrayColor.withOpacity(0.8),
                  width: 1.w,
                ),
              ),
              height: 50.h,
              child: Obx(
                () => DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: loginController.dropdownSpecialty.value,
                    items: specialties
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text('$e')))
                        .toList(),
                    onChanged: (newvalue) {
                      loginController.setSelectedSpecialty(newvalue.toString());
                    }),
              )),
          MyTextFieldWidget(
            hint: "075XXXXXXXX",
            title: "رقم العيادة",
          ),
          MyTextFieldWidget(
            hint: "عن الطبيب",
            title: "شهادات و اشياء الاخرى",
          ),
        ],
      )),
    );
  }
}

Widget textFieldTitle({required String subTitle}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    child: Text(
      subTitle,
      style: TextStyle(
        fontSize: 14.sp,
        color: kgrayColor,
      ),
    ),
  );
}