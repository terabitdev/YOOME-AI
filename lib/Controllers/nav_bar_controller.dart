// lib/controllers/nav_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/view/create_character_screen.dart';
import 'package:yoome_ai/view/home_screen.dart';
import 'package:yoome_ai/view/generate_images_screen.dart';
import 'package:yoome_ai/view/chat_screen.dart';
import 'package:yoome_ai/view/profile_screen.dart';

class NavController extends GetxController {
  /// Index of the tab that is currently *visible*.
  final RxInt selectedIndex = 0.obs;

  /// Pages that actually replace the scaffold body.
  /// We keep a CreateCharacter *screen* out of this list because it is now
  /// shown as a modal sheet, not a full page.
  final List pages = [
    const HomeScreen(), // 0
    const GenerateImagesScreen(), // 1
    const Placeholder(), // 2 (dummy slot for the “+” tab)
    const ChatScreen(), // 3
    const ProfileScreen(), // 4
  ];

  /// Call this from BottomNavigationBar.onTap
  void changeTab(int index) {
    // 2 == the slot for the “+ / create character” action
    if (index == 2) {
      Get.bottomSheet(
        CreateCharacterSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
      );
      // don’t change [selectedIndex] → the visible page stays as‑is
      return;
    }

    selectedIndex.value = index;
  }
}
