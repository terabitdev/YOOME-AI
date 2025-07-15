import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = true.obs;
  var username = ''.obs;
  var avatarUrl = ''.obs;
  var uid = ''.obs;
  var gender = ''.obs;
  var bio = ''.obs;
  var photoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;

      if (user != null) {
        uid.value = user.uid;

        final docRef = _firestore.collection('users').doc(user.uid);
        final doc = await docRef.get();

        if (doc.exists) {
          final data = doc.data() ?? {};
          debugPrint('🧾 Fetched Firestore data: $data');

          // Handle name
          String nameInFirestore = data['name']?.toString() ?? '';
          String fallbackName = user.email ?? 'User';

          if (nameInFirestore.trim().isEmpty) {
            debugPrint('✍️ Updating name in Firestore with $fallbackName');
            await docRef.update({'name': fallbackName});
            username.value = fallbackName;
          } else {
            username.value = nameInFirestore;
          }

          final fetchedPhotoUrl = data['photoUrl'] ?? user.photoURL ?? '';

          // ✅ Update both
          photoUrl.value = fetchedPhotoUrl;
          avatarUrl.value = fetchedPhotoUrl;

          gender.value = data['gender'] ?? 'Other';
          bio.value = data['bio'] ?? '';
        } else {
          // First-time Google user login, create Firestore doc
          debugPrint('📄 No Firestore doc found. Creating one...');
          await docRef.set({
            'uid': user.uid,
            'email': user.email,
            'name': user.email,
            'photoUrl': user.photoURL ?? '',
            'gender': 'Other',
            'bio': '',
            'createdAt': FieldValue.serverTimestamp(),
          });

          username.value = user.email ?? 'User';
          photoUrl.value = user.photoURL ?? '';
          avatarUrl.value = user.photoURL ?? '';
          gender.value = 'Other';
          bio.value = '';
        }
      }
    } catch (e) {
      debugPrint('❌ Error fetching profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateProfile({
    required String name,
    required String bio,
    required String gender,
    required String photoUrl,
  }) {
    username.value = name;
    this.bio.value = bio;
    this.gender.value = gender;
    this.photoUrl.value = photoUrl;
    this.avatarUrl.value = photoUrl;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
