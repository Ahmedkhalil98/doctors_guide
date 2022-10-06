import 'package:doctors_guide/Views/Screens/Register_doctor_info.dart';
import 'package:doctors_guide/Views/widgets/Text_field_widget.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterDoctorLocation extends StatelessWidget {
  const RegisterDoctorLocation({Key? key}) : super(key: key);

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
        child: MyButtonWidget(btntitle: "حفظ", color: kPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextFieldWidget(
              hint: "اسم منطقة,اسم شارع,اسم مشفى او مجمع",
              title: "أدخل العنوان العيادة :",
            ),
            textFieldTitle(subTitle: "قم بتحديد موقع العيادة على الخريطة:"),
            //! map
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              height: 400.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
