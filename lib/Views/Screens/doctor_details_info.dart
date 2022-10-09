import 'package:doctors_guide/Controllers/time_Controlller.dart';
import 'package:doctors_guide/Views/widgets/doctor_info_card.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorDetailsInfo extends StatelessWidget {
  DoctorDetailsInfo({super.key});
  var timeController = Get.put(TimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تخصص"),
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
          DoctorInfoCard(icon: const Icon(Icons.title), title: "تخصص"),
          DoctorInfoCard(icon: const Icon(Icons.title), title: "رقم التلفون"),
          Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: const Icon(Icons.timer_sharp),
              title: const Text(
                "اوقات الدوام",
              ),
              trailing: Text(
                timeController.fromTime,
              ),
            ),
          ),
          const Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: Icon(Icons.location_pin),
              title: Text(
                "العنوان",
              ),
              trailing: Text('عنوان الكامل'),
            ),
          ),
          DoctorInfoCard(
            icon: const Icon(Icons.title),
            title: "معلومات اكثر عن الدكتور",
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
