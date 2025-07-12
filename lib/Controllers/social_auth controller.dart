import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoome_ai/config/splash_services.dart';
import 'package:yoome_ai/nav_bar.dart';
import 'package:yoome_ai/view/welcome_screen.dart';

class SocialAuthController extends GetxController {
  final RxBool isGoogleLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/userinfo.profile'],
  );

  Future<void> signInWithGoogle() async {
    try {
      isGoogleLoading.value = true;

      // Step 1: Start Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        isGoogleLoading.value = false;
        return;
      }

      final email = googleUser.email;

      // Step 2: Check if email is already used with password
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      print('🛑 Sign-in methods for $email: $methods');

      if (methods.contains('password')) {
        Get.snackbar(
          'Account Exists',
          'This email is already registered with Email/Password. Please use that method to log in.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        isGoogleLoading.value = false;
        return;
      }

      // Step 3: Proceed only if not using 'password' method
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await _saveUserToFirestore(user);

        // Check if profile is complete
        final userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();
        final userData = userDoc.data();

        final hasProfile =
            userData != null &&
            userData.containsKey('gender') &&
            userData.containsKey('character') &&
            userData.containsKey('chatType') &&
            userData.containsKey('age');

        await SessionHelper.setProfileComplete(hasProfile);

        // Navigate
        if (hasProfile) {
          Get.offAll(() => CustomNavigationBar());
        } else {
          Get.offAll(() => const WelcomeScreen());
        }

        Get.snackbar(
          'Login Successful',
          'Welcome, ${user.displayName ?? "User"}!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        'Unexpected error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await SessionHelper.clearSession(); // 🧼 Clear session on sign-out
      Get.snackbar(
        'Signed Out',
        'You have been signed out successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Sign out error: $e');
    }
  }

  String _getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return 'This email is registered with a different sign-in method.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      case 'operation-not-allowed':
        return 'Google sign-in is not enabled for this project.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      default:
        return 'An error occurred during authentication.';
    }
  }

  Future<void> _saveUserToFirestore(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();
    if (!docSnapshot.exists) {
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}
