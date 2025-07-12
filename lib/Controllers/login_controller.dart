import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/config/splash_services.dart';
import 'package:yoome_ai/nav_bar.dart';
import 'package:yoome_ai/view/login_screnn.dart';
import 'package:yoome_ai/view/welcome_screen.dart';

class LoginController extends GetxController {
  // --------- Controllers ----------
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // --------- State (Errors & Loading) ----------
  final RxnString emailError = RxnString();
  final RxnString passwordError = RxnString();
  final RxBool isLoading = false.obs;

  // --------- Firebase Instances ----------
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --------- Validation Logic ----------
  bool _validate() {
    bool isValid = true;

    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      emailError.value = 'Enter a valid email';
      isValid = false;
    } else {
      emailError.value = null;
    }

    if (password.isEmpty || password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    return isValid;
  }

  // --------- Login Handler ----------
  Future<void> login() async {
    if (!_validate()) return;

    isLoading.value = true;

    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
            email: emailCtrl.text.trim(),
            password: passwordCtrl.text.trim(),
          );

      final uid = userCredential.user!.uid;
      final userDoc = await _firestore.collection('users').doc(uid).get();
      final userData = userDoc.data();

      bool hasProfile = false;

      if (userData != null) {
        hasProfile =
            userData.containsKey('gender') &&
            userData.containsKey('character') &&
            userData.containsKey('chatType') &&
            userData.containsKey('age');
      }

      // 🔐 Update the SharedPreferences session flag
      await SessionHelper.setProfileComplete(hasProfile);
      print("✅ Profile completion updated: $hasProfile");

      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFB56AFF),
        colorText: Colors.white,
      );

      if (hasProfile) {
        Get.offAll(() => CustomNavigationBar());
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emailError.value = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        passwordError.value = 'Wrong password.';
      } else {
        Get.snackbar(
          'Login Failed',
          e.message ?? 'Unknown error occurred',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // --------- Live Error Clearing on Typing ----------
  @override
  void onInit() {
    super.onInit();

    emailCtrl.addListener(() {
      if (emailError.value != null && emailCtrl.text.trim().isNotEmpty) {
        emailError.value = null;
      }
    });

    passwordCtrl.addListener(() {
      if (passwordError.value != null && passwordCtrl.text.trim().length >= 6) {
        passwordError.value = null;
      }
    });
  }

  // --------- Clean‑up ----------
  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}
