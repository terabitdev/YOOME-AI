// lib/controllers/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/verification_code_screen.dart';

class LoginController extends GetxController {
  // ---------- State ----------
  final emailCtrl = TextEditingController();
  final RxnString emailError = RxnString(); // null = no error
  final RxBool isLoading = false.obs;

  // ---------- Validation ----------
  bool _validate() {
    final email = emailCtrl.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      emailError.value = 'Enter a valid e‑mail';
      return false;
    }
    return true;
  }

  // ---------- Public API ----------
  Future<void> sendCode() async {
    if (!_validate()) return;

    isLoading.value = true;

    // TODO: call your backend / Firebase
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.off(() => VerificationCodeScreen());
  }

  // ---------- Clean‑up ----------
  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }
}
