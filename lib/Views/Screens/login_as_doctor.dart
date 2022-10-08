import 'package:doctors_guide/Views/widgets/text_field_widget.dart';
import 'package:doctors_guide/Views/widgets/button_widget.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LogInAsADoctor extends StatelessWidget {
  const LogInAsADoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الدخول كطبيب",
          style: titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
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
              hint: "الكود",
              title: "الرجاء أدخال الكود خاص بالطبيب هنا :",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: MyButtonWidget(btntitle: "الدخول", color: kPrimaryColor),
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
    );
  }
}