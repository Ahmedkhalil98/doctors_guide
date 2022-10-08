import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsInfo extends StatelessWidget {
  const DoctorDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات الطبيب'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 300.h,
                  child: Image.asset('images/doctorimg.jpg'),
                ),
              ),
              const Positioned(
                top: 250,
                right: 10,
                child: Text(
                  'اسم الطبيب',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
    );
  }
}
