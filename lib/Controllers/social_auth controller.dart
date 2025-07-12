import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yoome_ai/view/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SocialAuthController extends GetxController {
  final RxBool isGoogleLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fix: Use proper GoogleSignIn configuration
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/userinfo.profile'],
  );

  Future<void> signInWithGoogle() async {
    try {
      isGoogleLoading.value = true;
      // await _googleSignIn.signOut();
      // await _googleSignIn.disconnect();

      // Begin Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        isGoogleLoading.value = false;
        return; // user canceled
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Save user info to Firestore
        await _saveUserToFirestore(user);

        // Show success
        Get.snackbar(
          'Login Successful',
          'Welcome, ${user.displayName ?? "User"}!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate
        Get.off(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Authentication Error',
        _getFirebaseErrorMessage(e.code),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Google Sign-In Error: $e');
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> _saveUserToFirestore(User user) async {
    try {
      final userDoc = _firestore.collection('users').doc(user.uid);
      final snapshot = await userDoc.get();

      if (!snapshot.exists) {
        await userDoc.set({
          'uid': user.uid,
          'email': user.email,
          'name': user.displayName,
          'photoUrl': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
          'authMethod': 'google',
          'lastLogin': FieldValue.serverTimestamp(),
        });
      } else {
        // Update last login time
        await userDoc.update({'lastLogin': FieldValue.serverTimestamp()});
      }
    } catch (e) {
      print('Error saving user to Firestore: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
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
        return 'An account already exists with a different sign-in method.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      case 'operation-not-allowed':
        return 'Google sign-in is not enabled for this project.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for this account.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      default:
        return 'An error occurred during authentication.';
    }
  }
}
