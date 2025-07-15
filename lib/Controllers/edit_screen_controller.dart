import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yoome_ai/Controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final gender = ''.obs;
  final avatarUrl = ''.obs;
  final isLoading = false.obs;

  File? pickedImageFile;
  final ImagePicker _picker = ImagePicker();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;

      final user = _auth.currentUser;
      if (user == null) throw 'User not logged in';

      final doc = await _firestore.collection('users').doc(user.uid).get();

      if (doc.exists) {
        final data = doc.data() ?? {};

        nameController.text = data['name'] ?? user.email ?? '';
        bioController.text = data['bio'] ?? '';
        gender.value = data['gender'] ?? 'Other';
        avatarUrl.value = data['photoUrl'] ?? user.photoURL ?? '';
      } else {
        nameController.text = user.email ?? '';
        bioController.text = '';
        gender.value = 'Other';
        avatarUrl.value = user.photoURL ?? '';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch profile data: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void updateGender(String selectedGender) {
    gender.value = selectedGender;
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImageFile = File(pickedFile.path);
      avatarUrl.value = pickedImageFile!.path;
      update(); // 👈 update UI // for local preview
    }
  }

  Future<void> saveChanges() async {
    try {
      isLoading.value = true;
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw 'User not logged in';

      String? downloadUrl;

      // Upload image if picked
      if (pickedImageFile != null) {
        try {
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_profiles')
              .child('$uid.jpg');

          print('Uploading file from: ${pickedImageFile!.path}');
          final uploadTask = ref.putFile(pickedImageFile!);
          final snapshot = await uploadTask;

          if (snapshot.state == TaskState.success) {
            downloadUrl = await snapshot.ref.getDownloadURL();
            print('Image uploaded. Download URL: $downloadUrl');
          } else {
            throw 'Image upload failed. Please try again.';
          }
        } catch (e) {
          throw 'Error uploading image: $e';
        }
      }

      // Prepare data to update
      final updateData = {
        'name': nameController.text.trim(),
        'bio': bioController.text.trim(),
        'gender': gender.value,
      };

      if (downloadUrl != null) {
        updateData['photoUrl'] = downloadUrl;
      }

      await _firestore.collection('users').doc(uid).update(updateData);

      // Update local UI via ProfileController
      Get.find<ProfileController>().updateProfile(
        name: nameController.text.trim(),
        bio: bioController.text.trim(),
        gender: gender.value,
        photoUrl: downloadUrl ?? avatarUrl.value,
      );

      Get.snackbar(
        "Success",
        "Profile updated successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.back(); // Go back to profile screen
    } catch (e) {
      print('Error updating profile: $e');
      Get.snackbar(
        "Error",
        "Update failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
