import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:yoome_ai/Controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final gender = ''.obs;
  final avatarUrl = ''.obs;
  final isLoading = false.obs;
  var pickedImageFile = Rxn<File>(); // ✅ now observable

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
      pickedImageFile.value = File(pickedFile.path);
      avatarUrl.value = pickedImageFile.value!.path; // for local preview
      update();
    }
  }

  // ✅ Upload to Cloudinary
  Future<String> uploadImageToCloudinary(File imageFile) async {
    const cloudName = 'dcjsnjl0d'; // 🔁 Replace with actual
    const uploadPreset = 'flutter_unsigned'; // 🔁 Replace with actual
    const folder = 'user_profiles'; // Optional: your folder in Cloudinary

    final mimeType = lookupMimeType(imageFile.path);
    final mediaType = mimeType != null ? MediaType.parse(mimeType) : null;

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..fields['folder'] = folder
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          contentType: mediaType,
        ),
      );

    final response = await request.send();
    if (response.statusCode == 200) {
      final res = await http.Response.fromStream(response);
      final data = jsonDecode(res.body);
      return data['secure_url']; // ✅ Final image URL
    } else {
      throw 'Cloudinary upload failed: ${response.statusCode}';
    }
  }

  Future<void> saveChanges() async {
    try {
      isLoading.value = true;

      final uid = _auth.currentUser?.uid;
      if (uid == null) throw 'User not logged in';

      String? imageUrl;

      if (pickedImageFile.value != null &&
          pickedImageFile.value!.existsSync()) {
        imageUrl = await uploadImageToCloudinary(pickedImageFile.value!);
      }

      final updateData = {
        'name': nameController.text.trim(),
        'bio': bioController.text.trim(),
        'gender': gender.value,
      };

      if (imageUrl != null) {
        updateData['photoUrl'] = imageUrl;
      }

      await _firestore.collection('users').doc(uid).update(updateData);

      Get.find<ProfileController>().updateProfile(
        name: nameController.text.trim(),
        bio: bioController.text.trim(),
        gender: gender.value,
        photoUrl: imageUrl ?? avatarUrl.value,
      );

      isLoading.value = false;
      Get.back(); // ✅ Close the edit screen

      // ✅ THEN show snackbar
      Get.snackbar(
        "Success",
        "Profile updated successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "Update failed: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
