import 'dart:math';

import 'package:doctors_guide/constants/colors.dart';
import 'package:doctors_guide/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  Random colorIndex = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'قائمة اطباء',
          style: titleTextStyle,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
              ),
              Container(
                height: 130.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.white),
                      subtitle: Text('Specialization'),
                      trailing: Text('Open Time'),
                      title: Text(
                        'Doctor Name',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: cardColors[colorIndex.nextInt(17)],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'دهوك',
                            style: bodyTextStyle,
                          ),
                        ),
                        Text(
                          'تقيم للدكتور',
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
