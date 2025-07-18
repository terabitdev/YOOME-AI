// lib/helpers/session_helper.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoome_ai/view/sigin_screen.dart';

class SessionHelper {
  static const String _profileCompleteKey = 'isProfileComplete';

  // Save flag
  static Future<void> setProfileComplete(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_profileCompleteKey, value);
  }

  // Read flag
  static Future<bool> isProfileComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_profileCompleteKey) ?? false;
  }

  // Clear flag (for logout)
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileCompleteKey);
  }

  static Future<void> debugPrintPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    print("🔍 isProfileComplete: ${prefs.getBool(_profileCompleteKey)}");
  }

  // 🔐 Logout User (Firebase + Session + Navigation)
  static Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("✅ Firebase signed out");

      await clearSession();
      print("✅ Session cleared");

      Get.offAll(() => const SignInScreen());
    } catch (e) {
      Get.snackbar('Logout Error', e.toString());
    }
  }
}
