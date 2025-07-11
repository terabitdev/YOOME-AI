import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/view/login_screnn.dart';

class SignupController extends GetxController {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  final RxnString emailError = RxnString();
  final RxnString passwordError = RxnString();
  final RxnString confirmPasswordError = RxnString();
  final RxBool isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

    confirmPasswordCtrl.addListener(() {
      if (confirmPasswordError.value != null &&
          confirmPasswordCtrl.text.trim() == passwordCtrl.text.trim()) {
        confirmPasswordError.value = null;
      }
    });
  }

  bool _validate() {
    bool isValid = true;

    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final confirmPassword = confirmPasswordCtrl.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      emailError.value = 'Enter a valid email';
      isValid = false;
    } else {
      emailError.value = null;
    }

    if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError.value =
          'Confirm Password must be at least 6 characters';
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    } else {
      confirmPasswordError.value = null;
    }

    return isValid;
  }

  Future<void> signUp() async {
    if (!_validate()) return;

    isLoading.value = true;

    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailCtrl.text.trim(),
            password: passwordCtrl.text.trim(),
          );

      final uid = userCredential.user?.uid;

      if (uid != null) {
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': emailCtrl.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        Get.snackbar(
          'Success',
          'Account created successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xFFB56AFF),
          colorText: Colors.white,
        );

        Get.to(() => LoginScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Signup Failed',
        e.message ?? 'Unknown error',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.onClose();
  }
}
