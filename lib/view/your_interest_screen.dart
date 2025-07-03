// lib/view/your_interest_screen.dart - Fully Scrollable Version
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/nav_bar.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/progress_bar.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class YourInterestScreen extends StatefulWidget {
  const YourInterestScreen({Key? key}) : super(key: key);

  @override
  State<YourInterestScreen> createState() => _YourInterestScreenState();
}

class _YourInterestScreenState extends State<YourInterestScreen> {
  // Track selected interests
  List<String> selectedPersonality = [];
  List<String> selectedRelationship = [];
  List<String> selectedScene = [];

  // Interest categories data
  final Map<String, List<String>> interestCategories = {
    'Personality': [
      'Cold',
      'Dominance',
      'Care',
      'Possessiveness',
      'Helpless',
      'Hate You',
      'Possessiveness',
      'Helpless',
      'Hate You',
      'Quiet/Shy',
      'Bully',
      'Secretly Loves You',
      'Crazy',
      'Rude',
      'Dependent',
      'Contrast',
      'Submissive',
      'Your Crush',
      'Mature',
      'Flirty',
      'Lust',
      'Tsundere',
    ],
    'Relationship': [
      'Schoolmate', 'Villain', 'Husband',
      'Stranger', 'Sibling', 'Cousin',
      'Lover', 'Roommate', 'Roommate', // Duplicate as shown
      'Enemy', 'Tough Guy', 'Boss',
      'Non-Human', 'Friend', 'Childhood Friend',
      'Ex', 'Celebrity', 'Father', 'Servant',
      'Wife', 'Teacher', 'Mother', 'Neighbor',
    ],
    'Scene': [
      'Indoor', 'School', 'Get in Trouble',
      'Fantasy', 'Multi-character', 'Forced Marriage',
      'Marriage', 'Restriction of Movement', 'Rainy',
      'Narrow Space', 'Betray', 'Public',
      'Revenge', 'Force Love', 'Reunion',
      'Ex', 'Celebrity', 'Father', 'Servant', // Some duplicates as shown
      'Wife', 'Teacher', 'Mother', 'Neighbor',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressBarWidget(currentStep: 3, totalSteps: 3),
              SizedBox(height: 20.h),
              Text('Your Interests', style: YITextStyle19700),

              SizedBox(height: 30.h),

              // Personality Section
              _buildInterestSection(
                'Personality',
                interestCategories['Personality']!,
                selectedPersonality,
                (tag) {
                  setState(() {
                    if (selectedPersonality.contains(tag)) {
                      selectedPersonality.remove(tag);
                    } else {
                      selectedPersonality.add(tag);
                    }
                  });
                },
              ),

              SizedBox(height: 30.h),

              // Relationship Section
              _buildInterestSection(
                'Relationship',
                interestCategories['Relationship']!,
                selectedRelationship,
                (tag) {
                  setState(() {
                    if (selectedRelationship.contains(tag)) {
                      selectedRelationship.remove(tag);
                    } else {
                      selectedRelationship.add(tag);
                    }
                  });
                },
              ),

              SizedBox(height: 30.h),

              // Scene Section
              _buildInterestSection(
                'Scene',
                interestCategories['Scene']!,
                selectedScene,
                (tag) {
                  setState(() {
                    if (selectedScene.contains(tag)) {
                      selectedScene.remove(tag);
                    } else {
                      selectedScene.add(tag);
                    }
                  });
                },
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  // Skip Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _enterYoome();
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                        child: Center(
                          child: Text('Skip', style: YPBTextStyle14700),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 16.w),

                  // Enter YOOME Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => CustomNavigationBar());
                        _enterYoome();
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: ColorConstants.buttonColor,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Text('Enter YOOME', style: YPBTextStyle14700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInterestSection(
    String title,
    List<String> tags,
    List<String> selectedTags,
    Function(String) onTagTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: YIBTextStyle14500),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: tags
              .map(
                (tag) => _buildInterestTag(
                  tag,
                  selectedTags.contains(tag),
                  () => onTagTap(tag),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  // Build Individual Interest Tag
  Widget _buildInterestTag(String tag, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.buttonColor
              : const Color(0xFF4C1D95).withOpacity(0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? ColorConstants.buttonColor
                : const Color(0xFF6B46C1).withOpacity(0.8),
            width: 1.w,
          ),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFD1D5DB),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Handle Enter YOOME action
  void _enterYoome() {
    // Print selected interests for debugging
    print('Selected Personality: $selectedPersonality');
    print('Selected Relationship: $selectedRelationship');
    print('Selected Scene: $selectedScene');

    // Show success message
    Get.snackbar(
      'Welcome to YOOME!',
      'Your preferences have been saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorConstants.buttonColor,
      colorText: Colors.white,
    );
  }
}
