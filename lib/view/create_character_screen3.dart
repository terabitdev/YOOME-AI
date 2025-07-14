import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/characters_reuseable_card.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/chat_publish_screen.dart';
import 'package:yoome_ai/view/narrator_voice_screen.dart';

class CreateCharacterController extends GetxController {
  final nameController = TextEditingController();
  final introController = TextEditingController();
  final personalityController = TextEditingController();
  final welcomeMessageController = TextEditingController();
  final scenarioController = TextEditingController();

  var isPublic = true.obs;
  var nameCount = 0.obs;
  var selectedTags = <String>[].obs;
  var tempSelectedTags = <String>[].obs;

  final List<String> availableTags = [
    'Christmas',
    'Male',
    'Female',
    'Dominance',
    'Rebellious',
    'Drama',
    'Family',
    'Original character',
    'Not Lover',
    'Romance',
    'Cold',
    'Fantasy',
    'Anime & Game',
  ];

  void showTagsBottomSheet() {
    tempSelectedTags.value = List.from(selectedTags);
    Get.bottomSheet(
      _buildTagsBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void toggleTag(String tag) {
    if (tempSelectedTags.contains(tag)) {
      tempSelectedTags.remove(tag);
    } else if (tempSelectedTags.length < 5) {
      tempSelectedTags.add(tag);
    }
  }

  void confirmTags() {
    selectedTags.value = List.from(tempSelectedTags);
    Get.back();
  }

  void cancelTags() {
    tempSelectedTags.clear();
    Get.back();
  }

  Widget _buildTagsBottomSheet() {
    return Container(
      height: Get.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(color: Color(0xFF8B5CF6), width: 3),
          left: BorderSide(color: Color(0xFF8B5CF6), width: 3),
          right: BorderSide(color: Color(0xFF8B5CF6), width: 3),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Color.fromRGBO(160, 106, 249, 0.22),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tags',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Obx(
                  () => Text(
                    '${tempSelectedTags.length}/5',
                    style: const TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 12,
                  children: availableTags.map((tag) {
                    final isSelected = tempSelectedTags.contains(tag);
                    return GestureDetector(
                      onTap: () => toggleTag(tag),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(160, 106, 249, 0.22),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF8B5CF6)
                                : const Color(0xFF444444),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFCCCCCC),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: cancelTags,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF8B5CF6)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: confirmTags,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5CF6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize with the sample data from the image
    nameController.text = "Grathok the Furious";
    nameCount.value = nameController.text.length;

    introController.text =
        "You are intruding on Grathok's territory. Prepare for anger.";

    personalityController.text =
        "Species_and_Major_Physical_Traits: Grathok is a powerfully built Orc, standing well over seven feet tall. His skin is a deep green, scarred and weathered from countless battles. Thick, coarse black hair sprouts from his head in wild clumps, partially braided with scraps of leather and.....";

    welcomeMessageController.text =
        "The wind howls through the mountain pass, whipping snow into your face. You pull your cloak tighter, shivering as you trudge through the deepening drifts. Your destination village is still a day away. Suddenly, a guttural roar shatters the silence.\n\n{{char}}: \"WHO DARES TRESPASS ON GRATHOK'S LAND?! SHOW YOURSELF, WEAKLING!\"";

    scenarioController.text =
        "You are a wandering merchant, traveling through a desolate mountain pass. A heavy snow is falling, obscuring the path ahead. You stumble upon a crude campsite, a fire crackling weakly against the biting wind. Suddenly, a hulking figure emerges from the shadows, his face a mask of pure rage.";

    nameController.addListener(() {
      nameCount.value = nameController.text.length;
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    introController.dispose();
    personalityController.dispose();
    welcomeMessageController.dispose();
    scenarioController.dispose();
    super.onClose();
  }
}

class CreateCharacterScreen3 extends StatefulWidget {
  const CreateCharacterScreen3({super.key});

  @override
  State<CreateCharacterScreen3> createState() => _CreateCharacterScreen3State();
}

class _CreateCharacterScreen3State extends State<CreateCharacterScreen3> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateCharacterController());

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Create Character',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character Image Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromRGBO(160, 106, 249, 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A3B7A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/images/focusimage.png'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Use [focus] to adjust the image.',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 30.h,
                        width: 70.w,
                        padding: const EdgeInsets.fromLTRB(9, 4, 9, 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5CF6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/focus.png',
                              width: 13.w,
                              height: 13.h,
                            ),
                            const SizedBox(width: 4),
                            Text('Focus', style: CCSTextStyle12400),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text('Name', style: CCSTextStyle124002),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: TextField(
                controller: controller.nameController,
                style: CCSTextStyle124003,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Enter character name',
                  hintStyle: TextStyle(color: Color(0xFF666666)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Intro Field
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Intro', style: CCSTextStyle145005),
                  TextSpan(text: '*', style: CCSTextStyle145005),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: const Color.fromRGBO(160, 106, 249, 1),
                ),
              ),
              child: TextField(
                controller: controller.introController,
                style: CCSTextStyle124003,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Enter intro',
                  hintStyle: TextStyle(color: Color(0xFF666666)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Personality Field
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Personality', style: CCSTextStyle145005),
                  TextSpan(text: '*', style: CCSTextStyle145005),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: const Color.fromRGBO(160, 106, 249, 1),
                ),
              ),
              child: TextField(
                controller: controller.personalityController,
                style: CCSTextStyle124003,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Describe the personality',
                  hintStyle: TextStyle(color: Color(0xFF666666)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Welcome Message Field
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Welcome message', style: CCSTextStyle145005),
                  TextSpan(text: '*', style: CCSTextStyle145005),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: const Color.fromRGBO(160, 106, 249, 1),
                ),
              ),
              child: TextField(
                controller: controller.welcomeMessageController,
                style: CCSTextStyle124003,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Enter welcome message',
                  hintStyle: TextStyle(color: Color(0xFF666666)),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Permissions
            Text('Permissions', style: CCSTextStyle145005),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.isPublic.value = true,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          // color: controller.isPublic.value
                          //     ? const Color(0xFF8B5CF6)
                          //     : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: controller.isPublic.value
                                ? const Color(0xFF8B5CF6)
                                : const Color(0xFF2A2A2A),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              controller.isPublic.value
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: const Color(0xFF8B5CF6),
                              size: 15,
                            ),
                            const SizedBox(width: 12),
                            Text('Public', style: CCSTextStyle105004),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.isPublic.value = false,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          // color: !controller.isPublic.value
                          //     ? const Color(0xFF8B5CF6)
                          //     : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: !controller.isPublic.value
                                ? const Color(0xFF8B5CF6)
                                : const Color(0xFF2A2A2A),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              !controller.isPublic.value
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: const Color(0xFF8B5CF6),
                              size: 15,
                            ),
                            const SizedBox(width: 12),
                            Text('Private', style: CCSTextStyle105004),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Tags Section
            Text('Tags', style: CCSTextStyle124002),
            const SizedBox(height: 8),
            CharactersReuseableCard(
              title: 'Tag the gender, species, and traits',
              onTap: () {
                controller.showTagsBottomSheet();
              },
            ),

            const SizedBox(height: 24),

            // Advanced Settings
            Text('Advanced settings', style: CCSTextStyle124002),
            const SizedBox(height: 12),

            // Scenario
            const Text(
              'Scenario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 165.h,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: const Color.fromRGBO(160, 106, 249, 1),
                ),
              ),
              child: TextField(
                controller: controller.scenarioController,
                style: CCSTextStyle124003,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Enter scenario',
                  hintStyle: TextStyle(color: Color(0xFF666666)),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Example Conversations
            Text('Example conversations', style: CCSTextStyle124002),
            const SizedBox(height: 8),
            CharactersReuseableCard(
              title: 'Edit example conversations',
              onTap: () {
                // Handle example conversations tap
              },
            ),

            const SizedBox(height: 16),

            // Voice
            Text('Voice', style: CCSTextStyle124002),
            const SizedBox(height: 8),
            CharactersReuseableCard(
              title: 'Select voice',
              onTap: () {
                Get.to(NarratorVoiceScreen());
              },
            ),

            const SizedBox(height: 32),
            RoundButton(
              title: 'Next',
              onTap: () {
                Get.to(ChatPublishScreen());
              },
              color: const Color(0xFF8B5CF6),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
