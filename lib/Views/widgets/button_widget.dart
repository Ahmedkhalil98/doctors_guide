import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtonWidget extends StatelessWidget {
  MyButtonWidget({
    Key? key,
    required this.btntitle,
    required this.color,
  }) : super(key: key);
  Color color;
  String btntitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.center,
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: kGrayColor,
              spreadRadius: 0.5,
              blurRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(10.r)),
      child: Text(
        btntitle,
        style: TextStyle(
          fontSize: 18.sp,
          color: kWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
