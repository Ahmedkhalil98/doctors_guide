import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFieldWidget extends StatelessWidget {
  String hint;
  String title;
  String? helpText;
  TextEditingController controller;
  final String? Function(String?) valid;

  MyTextFieldWidget(
      {Key? key,
      required this.hint,
      required this.title,
      this.helpText,
      required this.controller,
      required this.valid})
      : super(key: key);

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
              color: kGrayColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: TextFormField(
            validator: valid,
            controller: controller,
            style: Theme.of(context).textTheme.bodySmall,
            // keyboardType: typeinput,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              helperStyle: const TextStyle(color: Colors.red),
              suffix: Text(helpText ?? " "),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(width: 1.w, color: kPrimaryColor)),
            ),
          ),
        ),
      ],
    );
  }
}
