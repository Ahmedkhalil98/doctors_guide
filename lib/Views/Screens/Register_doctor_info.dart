import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:doctors_guide/Views/widgets/Text_field_widget.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/iraq_cities_and_specialties.dart';
import 'package:doctors_guide/utils/valid_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class RegisterDoctorInfo extends StatelessWidget {
  RegisterDoctorInfo({Key? key}) : super(key: key);

  final loginController = Get.put(LogInDoctorController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "دخول كطبيب",
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GestureDetector(
            onTap: () {
              loginController.nextForm();
            },
            child: MyButtonWidget(btntitle: "تالي", color: kPrimaryColor)),
      ),
      body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: loginController.doctorFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFieldWidget(
                  valid: (value) {
                    return validInput(value!, 200, "name");
                  },
                  controller: loginController.fullName,
                  hint: "ادخل اسم الطبيب",
                  title: "اسم الطبيب الثلاثي :",
                ),
                textFieldTitle(subTitle: "المحافظة :"),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: kGrayColor.withOpacity(0.8),
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
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    '$e',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newvalue) {
                            loginController
                                .setSelectedCity(newvalue.toString());
                          }),
                    )),
                textFieldTitle(subTitle: "التخصص :"),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: kGrayColor.withOpacity(0.8),
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
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    '$e',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (newvalue) {
                            loginController
                                .setSelectedSpecialty(newvalue.toString());
                          }),
                    )),
                MyTextFieldWidget(
                  valid: (value) {
                    return validInput(value!, 11, "phone");
                  },
                  controller: loginController.phoneNumber,
                  hint: "075xxxxxxx",
                  title: "رقم هاتف العيادة :",
                  typeinput: TextInputType.phone,
                ),
                MyTextFieldWidget(
                  valid: (value) {
                    return validInput(value!, 10, "price");
                  },
                  controller: loginController.price,
                  hint: "ادخل السعر بالدينار",
                  title: "سعر الكشفية :",
                  typeinput: TextInputType.phone,
                  helpText: "IQD",
                ),
                textFieldTitle(subTitle: "ارفع صورة شخصية :"),
                Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(width: 1.w, color: kGrayColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 250.w,
                          padding: EdgeInsets.only(right: 5.w),
                          child: GetBuilder<LogInDoctorController>(
                            builder: (imageController) => Text(
                              loginController.image == null
                                  ? "لم يتم رفع أي صورة بعد"
                                  : basename(imageController.image!.path),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kGrayColor.withOpacity(0.6),
                                fontSize: 12.sp,
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          loginController.uploadImage();
                        },
                        child: SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: Image.asset("images/uploadImage.png")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.h,
                )
              ],
            ),
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
        color: kGrayColor,
      ),
    ),
  );
}
