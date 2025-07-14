import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

// Voice model for the data
class VoiceModel {
  final String name;
  final List<String> tags;

  VoiceModel({required this.name, required this.tags});
}

class NarratorVoiceScreen extends StatefulWidget {
  const NarratorVoiceScreen({super.key});

  @override
  State<NarratorVoiceScreen> createState() => _NarratorVoiceScreenState();
}

class _NarratorVoiceScreenState extends State<NarratorVoiceScreen> {
  int selectedVoiceIndex = -1; // -1 means no selection

  // Dummy data matching the image exactly
  final List<VoiceModel> voices = [
    VoiceModel(
      name: "Friendly Neighbor",
      tags: ["Female", "Adult", "Gentle", "Calm", "Friendly"],
    ),
    VoiceModel(
      name: "Knowledgeable Lady",
      tags: ["Female", "Adult", "Elegant", "Smart", "Calm"],
    ),
    VoiceModel(
      name: "Assertive Queen",
      tags: ["Female", "Adult", "Calm", "Assertive", "Commanding"],
    ),
    VoiceModel(
      name: "Naughty Schoolgirl",
      tags: ["Female", "Youth", "Energetic", "Mischievous", "Lively"],
    ),
    VoiceModel(
      name: "Calm Researcher",
      tags: ["Female", "Adult", "Official", "Gentle", "Teache"],
    ),
    VoiceModel(
      name: "Young Anime Girl",
      tags: ["Female", "Youth", "Cute", "Spirited", "Animated"],
    ),
    VoiceModel(
      name: "Attractive Woman",
      tags: ["Female", "Adult", "Sexy", "Sultry", "Tempting"],
    ),
    VoiceModel(
      name: "Whimsical Girl",
      tags: ["Female", "Youth", "Sweet", "Younger", "Happy"],
    ),
    VoiceModel(
      name: "Gorgeous Lady",
      tags: ["Female", "Adult", "Alluring", "Slow-paced", "Mysterious"],
    ),
    VoiceModel(
      name: "Knowledgeable Lady",
      tags: ["Female", "Adult", "Elegant", "Smart", "Calm"],
    ),
    VoiceModel(
      name: "Sunny Girl",
      tags: ["Female", "Youth", "Cheerful", "Sunny", "Optimistic"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 52.h, 24.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Narrator voice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: ColorConstants.lightGrey.withOpacity(.25),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Voice List
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(16.w),
                        itemCount: voices.length,
                        itemBuilder: (context, index) {
                          final voice = voices[index];
                          final isSelected = selectedVoiceIndex == index;

                          return Container(
                            width: double.infinity,
                            height: 130.h,
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF8B5CF6).withOpacity(0.3)
                                  : const Color.fromRGBO(35, 23, 55, 1),
                              borderRadius: BorderRadius.circular(12.r),
                              border: isSelected
                                  ? Border.all(
                                      color: const Color(0xFF8B5CF6),
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVoiceIndex = index;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Voice Name
                                  Text(voice.name, style: NVSTextStyle14500),

                                  SizedBox(height: 12.h),

                                  // Tags
                                  Wrap(
                                    spacing: 4.w,
                                    runSpacing: 4.h,
                                    children: voice.tags.map((tag) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 6.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                            160,
                                            106,
                                            249,
                                            0.22,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      child: DualActionButtons(
                        leftLabel: "Cancel",
                        rightLabel: "Select",
                        onLeftTap: () {},
                        onRightTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
