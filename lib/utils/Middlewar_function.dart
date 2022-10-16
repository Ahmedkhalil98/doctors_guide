import 'package:doctors_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMiddleWarFun extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (localStorage!.getString('role') == "user") {
      return const RouteSettings(name: '/homeScreen');
    }

    if (localStorage!.getString('role') == "admin") {
      return const RouteSettings(name: '/homeScreen');
    }
    if (localStorage!.getString('role') == "adminInRegister") {
      return const RouteSettings(name: '/adminInRegister');
    }
    return null;
  }
}
