import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFieldWidget extends StatelessWidget {
  MyTextFieldWidget({Key? key, required this.hint, required this.title})
      : super(key: key);
  String hint;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: kgrayColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextFormField(
            //controller: controll,
            // keyboardType: typeinput,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: kgrayColor.withOpacity(0.6),
              ),
              suffixStyle: const TextStyle(color: Colors.grey),
              helperStyle: const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
