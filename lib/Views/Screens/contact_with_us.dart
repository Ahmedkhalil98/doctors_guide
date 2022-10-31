import 'dart:io';

import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});
  openwhatsapp({
    required BuildContext context,
    required String number,
    required String msg,
  }) async {
    String whatsapp = "+964$number";
    String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$msg";
    String whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("msg")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappURLIos))) {
        await launchUrl(
          Uri.parse(whatappURLIos),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  openTelegram({
    required BuildContext context,
    required String userName,
  }) async {
    // var telegram = '+964$userName';
    // String telegram = userName;
    String telegragURlAndroid = "https://telegram.me/$userName";
    String telegramURLIos = "https://telegram.me/$userName";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(telegramURLIos))) {
        await launchUrl(
          Uri.parse(telegramURLIos),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Telegram not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(telegragURlAndroid))) {
        await launchUrl(Uri.parse(telegragURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Telegram not installed")));
      }
    }
  }

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
              Text(
                'المطورين',
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
                        openwhatsapp(
                            context: context,
                            number: '7827509472',
                            msg: 'مرحبا');
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
                        openTelegram(context: context, userName: 'ahmed251998');
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
                        openwhatsapp(
                            context: context,
                            number: '7824828348',
                            msg: 'مرحبا');
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
