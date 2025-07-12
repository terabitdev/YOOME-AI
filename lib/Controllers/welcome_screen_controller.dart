import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoome_ai/config/splash_services.dart';
import 'package:yoome_ai/view/your_interest_screen.dart';
import 'package:yoome_ai/view/your_preference_screen.dart';
import '../models/user_profile_model.dart';
import '../nav_bar.dart';

class WelcomeController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

  // 🎯 Welcome Screen Fields
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  var selectedGender = ''.obs;
  var selectedAge = ''.obs;

  final genderOptions = [
    {'id': 'female', 'label': 'Female', 'image': 'assets/images/female.png'},
    {'id': 'male', 'label': 'Male', 'image': 'assets/images/male.png'},
    {'id': 'other', 'label': 'Other', 'image': 'assets/images/trans.png'},
  ];
  final ageOptions = ['12-18', '18-25', '25-30', '30+'];

  // 💬 Preference Screen Fields
  var selectedCharacter = ''.obs;
  var selectedReplay = ''.obs;

  // 💡 Interests Screen Fields
  var selectedPersonality = <String>[].obs;
  var selectedRelationship = <String>[].obs;
  var selectedScene = <String>[].obs;

  @override
  void onInit() {
    emailCtrl.text = user?.email ?? '';
    super.onInit();
  }

  void selectGender(String gender) => selectedGender.value = gender;
  void selectAge(String age) => selectedAge.value = age;

  Future<void> onNextFromWelcome() async {
    if (emailCtrl.text.trim().isEmpty) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        'Required',
        'Please enter your email',
      );
      return;
    }
    if (selectedGender.value.isEmpty || selectedAge.value.isEmpty) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        'Required',
        'Please select gender and age',
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'uid': user!.uid,
        'email': emailCtrl.text.trim(),
        'gender': selectedGender.value,
        'age': selectedAge.value,
      }, SetOptions(merge: true));

      Get.to(YourPreferenceScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to save: $e');
    }
  }

  void selectCharacter(String character) => selectedCharacter.value = character;
  void selectReplay(String replay) => selectedReplay.value = replay;

  Future<void> onNextFromPreference() async {
    if (selectedCharacter.value.isEmpty || selectedReplay.value.isEmpty) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        'Required',
        'Please select character and chat type',
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'character': selectedCharacter.value,
        'chatType': selectedReplay.value,
      }, SetOptions(merge: true));

      Get.to(() => YourInterestScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to save: $e');
    }
  }

  void toggleInterest(RxList<String> list, String value) {
    list.contains(value) ? list.remove(value) : list.add(value);
  }

  void onEnterYoome() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        Get.snackbar(
          'Error',
          'User not logged in!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final profile = UserProfileModel(
        name: nameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        gender: selectedGender.value,
        age: selectedAge.value,
        character: selectedCharacter.value,
        chatType: selectedReplay.value,
        personality: selectedPersonality.toList(),
        relationship: selectedRelationship.toList(),
        scene: selectedScene.toList(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(profile.toJson());

      await SessionHelper.setProfileComplete(true); // ✅ Save locally

      Get.snackbar(
        'Success',
        'Your profile has been saved successfully',
        backgroundColor: Color(0xFFB56AFF),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAll(() => CustomNavigationBar()); // ✅ Navigate to main screen
    } catch (e) {
      print('Error saving profile: $e');
      Get.snackbar(
        'Error',
        'Failed to save profile: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
