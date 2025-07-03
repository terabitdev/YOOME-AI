import 'package:get/get.dart';

class ChatController extends GetxController {
  var selectedTab = 0.obs;

  final List<ChatItem> chats = [
    ChatItem(
      name: "Demod - Enimy",
      message: "Lorem ipsum dolor sit amet, consectetur",
      time: "9min",
      avatarUrl:
          "https://images.unsplash.com/photo-1494790108755-2616b612b53c?w=150&h=150&fit=crop&crop=face",
    ),
    ChatItem(
      name: "Demod - Enimy",
      message: "Lorem ipsum dolor sit amet, consectetur",
      time: "9min",
      avatarUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
    ),
    ChatItem(
      name: "Demod - Enimy",
      message: "Lorem ipsum dolor sit amet, consectetur",
      time: "9min",
      avatarUrl:
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&h=150&fit=crop&crop=face",
    ),
    ChatItem(
      name: "Demod - Enimy",
      message: "Lorem ipsum dolor sit amet, consectetur",
      time: "9min",
      avatarUrl:
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150&h=150&fit=crop&crop=face",
    ),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });
}
