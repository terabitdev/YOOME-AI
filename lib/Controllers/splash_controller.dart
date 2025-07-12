// lib/controllers/splash_controller.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoome_ai/config/splash_services.dart';
import 'package:yoome_ai/nav_bar.dart';
import 'package:yoome_ai/view/sigin_screen.dart';
import 'package:yoome_ai/view/welcome_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.offAll(() => const SignInScreen());
        return;
      }

      // 🔁 Try refreshing user to validate
      await user.reload();
      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (refreshedUser == null) {
        await SessionHelper.clearSession(); // clear any saved flags
        Get.offAll(() => const SignInScreen());
        return;
      }

      final isComplete = await SessionHelper.isProfileComplete();
      if (isComplete) {
        Get.offAll(() => CustomNavigationBar());
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    } catch (e) {
      print('Splash Error: $e');
      await SessionHelper.clearSession(); // fallback
      Get.offAll(() => const SignInScreen());
    }
  }
}
