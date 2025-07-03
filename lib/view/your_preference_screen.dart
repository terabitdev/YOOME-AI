// lib/view/your_preference_screen.dart - Debug Version
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/progress_bar.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/your_interest_screen.dart';

class YourPreferenceScreen extends StatefulWidget {
  const YourPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<YourPreferenceScreen> createState() => _YourPreferenceScreenState();
}

class _YourPreferenceScreenState extends State<YourPreferenceScreen> {
  String selectedCharacter = '';
  String selectedReplay = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ─── Progress bar stays full‑width ───
            const ProgressBarWidget(currentStep: 2, totalSteps: 3),

            // ─── Everything else gets ONE horizontal padding of 24 ───
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text('Your Preferences', style: YPTextStyle19700),

                      SizedBox(height: 40.h),
                      Text('Character Preferences', style: YPTextStyle214500),

                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: CharacterCard(
                              title: 'Male',
                              imagePath: 'assets/images/animal.png',
                              isSelected: selectedCharacter == 'male',
                              onTap: () =>
                                  setState(() => selectedCharacter = 'male'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CharacterCard(
                              title: 'Female',
                              imagePath: 'assets/images/cat.png',
                              isSelected: selectedCharacter == 'female',
                              onTap: () =>
                                  setState(() => selectedCharacter = 'female'),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40.h),
                      Text('Character Replay', style: YPMFTextStyle15400),

                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: CharacterCard(
                              title: '',
                              imagePath: 'assets/images/Card.png',
                              isSelected: selectedReplay == 'casual',
                              onTap: () =>
                                  setState(() => selectedReplay = 'casual'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CharacterCard(
                              title: '',
                              imagePath: 'assets/images/Card.png',
                              isSelected: selectedReplay == 'long',
                              onTap: () =>
                                  setState(() => selectedReplay = 'long'),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 60.h), // space above buttons
                    ],
                  ),
                ),
              ),
            ),

            // ─── Bottom buttons also live in the same Padding ───
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  // Skip
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        minimumSize: Size.fromHeight(50.h),
                      ),
                      onPressed: () {},
                      child: Text('Skip', style: YPBTextStyle14700),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // Enter YOOME
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        minimumSize: Size.fromHeight(50.h),
                      ),
                      onPressed: () {
                        Get.to(() => const YourInterestScreen());
                      },
                      child: Text('Enter YOOME', style: YPBTextStyle14700),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  /// Full asset path, e.g. 'assets/images/animal.png'
  final String imagePath;

  /// Text you might want under the image (“Male”, “Female”, etc.)
  final String title;

  /// Set to `false` when you don’t want the title rendered.
  final bool showTitle;

  /// Whether this card is currently selected.
  final bool isSelected;

  /// Tap callback.
  final VoidCallback onTap;

  const CharacterCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.showTitle = true, // default: show the title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 149, // your original height
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 149,
                  color: const Color(0xFF8B5CF6),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Optional title
            if (showTitle)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(title, style: YPMFTextStyle15400),
              ),
          ],
        ),
      ),
    );
  }
}
