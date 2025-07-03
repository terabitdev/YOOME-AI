import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/chat_screen_controller.dart';
import 'package:yoome_ai/resources/components/custom_appheader.dart';

class ChatScreenStateful extends StatefulWidget {
  const ChatScreenStateful({super.key});

  @override
  State<ChatScreenStateful> createState() => _ChatScreenStateful();
}

class _ChatScreenStateful extends State<ChatScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Column(
        children: [
          const CustomAppHeader(title: "Trending"),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.changeTab(0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 0
                              ? const Color(0xFF7C3AED)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Chats",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.selectedTab.value == 0
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.changeTab(1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 1
                              ? const Color(0xFF7C3AED)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Following",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.selectedTab.value == 1
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                itemCount: controller.chats.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                          'assets/images/generateimage.png',
                        ),
                      ),
                      title: Text(
                        'Daniyal',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'What\'s up?',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '2h ago',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
