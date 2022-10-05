import 'package:doctors_guide/Views/widgets/Text_field_widget.dart';
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
              margin: EdgeInsets.only(bottom: 20.h, right: 35.w),
              height: 250.h,
              child: Lottie.asset("images/doctorCard.json"),
            ),
            MyTextFieldWidget(
              hint: "الكود",
              title: "الرجاء أدخال الكود خاص بالطبيب هنا :",
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 70.h, bottom: 10.h),
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
              padding: EdgeInsets.only(bottom: 80.h),
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
