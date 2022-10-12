import 'package:doctors_guide/Controllers/login_Doctor_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LogInDoctorController());
  }
}
