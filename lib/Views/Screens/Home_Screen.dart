import 'dart:math';

import 'package:doctors_guide/constants/colors.dart';
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
        title: const Text(
          'قائمة اطباء',
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
                height: 150.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
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
                    Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: cardColors[2],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
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
                    Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: cardColors[2],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
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
