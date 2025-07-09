import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/chat_screen_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/custom_appheader.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Column(
        children: [
          // ───────── App Header ─────────
          const CustomAppHeader(title: "Trending"),

          // ───────── Black Rounded Container ─────────
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                border: Border(
                  top: BorderSide(color: ColorConstants.lightGrey, width: 1),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // ───────── Tab Bar ─────────
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(
                        36,
                        4,
                        89,
                        1,
                      ), // Unselected tab bg
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        // ───── Tab 1: Chats ─────
                        Expanded(
                          child: Obx(
                            () => GestureDetector(
                              onTap: () => controller.changeTab(0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.selectedTab.value == 0
                                      ? const Color(0xFF7C3AED) // Selected
                                      : Colors
                                            .transparent, // Transparent inside container
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

                        // ───── Tab 2: Following ─────
                        Expanded(
                          child: Obx(
                            () => GestureDetector(
                              onTap: () => controller.changeTab(1),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
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

                  // ───────── Chat List ─────────
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: controller.chats.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              65,
                              3,
                              26,
                              104,
                            ), // semi-transparent
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(MatthewSupportsScreen());
                            },
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              leading: const CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(
                                  'assets/images/imagegenerate.png',
                                ),
                              ),
                              title: Text('Daniyal', style: CSTextStyle15400),
                              subtitle: Text(
                                'What\'s up?',
                                style: CSTextStyle10500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: const Text(
                                '2h ago',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
