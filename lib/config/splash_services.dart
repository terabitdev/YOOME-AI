import 'dart:async';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    // Simulate a delay for splash screen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the login screen after the delay
      Get.offAllNamed('/login');
    });
  }
}
