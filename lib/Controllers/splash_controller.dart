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
      await Future.delayed(const Duration(seconds: 2));
      print("✅ Splash delay complete");

      final user = await FirebaseAuth.instance.authStateChanges().first;
      print("👤 Firebase user: ${user?.uid}");

      if (user == null) {
        print("🔒 No user found. Redirecting to SignInScreen");
        await SessionHelper.clearSession();
        Get.offAll(() => const SignInScreen());
        return;
      }

      final isComplete = await SessionHelper.isProfileComplete();
      print("📦 isProfileComplete: $isComplete");

      if (isComplete) {
        print("✅ Profile complete. Going to Home.");
        Get.offAll(() => CustomNavigationBar());
      } else {
        print("👋 Profile incomplete. Going to Welcome.");
        Get.offAll(() => const WelcomeScreen());
      }

      await SessionHelper.debugPrintPrefs();
    } catch (e) {
      print('❌ Splash Error: $e');
      await SessionHelper.clearSession();
      Get.offAll(() => const SignInScreen());
    }
  }
}
