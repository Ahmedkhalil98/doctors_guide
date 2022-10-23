import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 250.w,
          height: 100.h,
          child: Lottie.asset("images/loading.json")),
    );
  }
}
