// lib/controllers/verification_controller.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/view/welcome_screen.dart';

class VerificationController extends GetxController {
  // Text controller for the 4-digit code
  final TextEditingController codeCtrl = TextEditingController();

  // State variables
  final RxnString codeError = RxnString(); // For error message under PIN field
  final RxBool isLoading =
      false.obs; // For showing spinner during "verification"
  final RxInt secondsLeft = 60.obs; // Countdown for "Resend Code" button

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  @override
  void onClose() {
    codeCtrl.dispose();
    _timer?.cancel();
    super.onClose();
  }

  /// Validates the code (basic: 4 digits)
  bool _validateCode() {
    final code = codeCtrl.text.trim();
    if (code.length != 4 || !RegExp(r'^\d{4}$').hasMatch(code)) {
      codeError.value = "Enter a valid 4-digit code";
      return false;
    }
    codeError.value = null;
    return true;
  }

  /// Called when "Verify" is tapped
  Future<void> verifyCode() async {
    if (!_validateCode()) return;

    isLoading.value = true;

    // Fake delay for simulating verification process
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // For now, just log or show success
    Get.snackbar("Success", "Code verified successfully!");
    Get.to(() => WelcomeScreen());
    // Later: Navigate to next screen or trigger session
  }

  /// Called when "Resend Code" is tapped
  void resendCode() {
    if (secondsLeft.value > 0) return;

    // TODO: Call your backend here in future
    secondsLeft.value = 60;
    _startCountdown();
    Get.snackbar("Resent", "Verification code has been resent.");
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value == 0) {
        timer.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }
}
