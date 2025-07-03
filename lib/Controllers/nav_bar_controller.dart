// lib/controllers/nav_controller.dart
import 'package:get/get.dart';
import 'package:yoome_ai/view/home_screen.dart';
import 'package:yoome_ai/view/generate_images_screen.dart';
import 'package:yoome_ai/view/create_character_screen.dart';
import 'package:yoome_ai/view/chat_screen.dart';
import 'package:yoome_ai/view/profile_screen.dart';

class NavController extends GetxController {
  // current tab index
  final RxInt selectedIndex = 0.obs;

  // list of pages (keep them once; no need to rebuild every tab change)
  final List pages = [
    const HomeScreen(),
    const GenerateImagesScreen(),
    const CreateCharacterScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void changeTab(int index) => selectedIndex.value = index;
}
