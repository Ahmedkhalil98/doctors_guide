import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'من نحن ',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'يمكنك تواصل معنا من خلال ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                ' Telegram & Whatsapp ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ListTile(
                leading: const CircleAvatar(backgroundColor: kSecondColor),
                title: Text(
                  'سامان دخيل ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('Flutter Developer',
                    style: TextStyle(
                      color: kGrayColor,
                      fontSize: 12.sp,
                    )),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(10.0),
                      onPressed: () {
                        //ToDo : connect with Tw
                      },
                      icon: Icon(
                        Icons.telegram,
                        size: 30.h,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(10.0),
                      onPressed: () {
                        //ToDo : connect with Tw
                      },
                      icon: Icon(
                        Icons.whatsapp,
                        size: 30.h,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const CircleAvatar(backgroundColor: kSecondColor),
                title: Text(
                  'احمد خليل',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text('Flutter Developer',
                    style: TextStyle(
                      color: kGrayColor,
                      fontSize: 12.sp,
                    )),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(10.0),
                      onPressed: () {
                        //ToDo : connect with Tw
                      },
                      icon: Icon(
                        Icons.telegram,
                        size: 30.h,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(10.0),
                      onPressed: () {
                        //ToDo : connect with Tw
                      },
                      icon: Icon(
                        Icons.whatsapp,
                        size: 30.h,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
