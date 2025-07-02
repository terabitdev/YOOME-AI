// lib/view/your_preference_screen.dart - Debug Version
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/progress_bar.dart';
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
            // Progress Bar
            const ProgressBarWidget(currentStep: 2, totalSteps: 3),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                    // Title
                    Text(
                      'Your Preferences',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Character Preferences Section
                    Text(
                      'Character Preferences',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        _buildCharacterCard('Male', 'assets/images/2.png'),
                        SizedBox(width: 16.w),
                        _buildCharacterCard('Female', 'assets/images/1.png'),
                      ],
                    ),

                    SizedBox(height: 40.h),

                    // Character Replay Section
                    Text(
                      'Character Replay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Replay Cards Row
                    Row(
                      children: [
                        _buildReplayCard(
                          'Interactive Story',
                          '(Long Conversation)',
                          'interactive_story',
                        ),
                        SizedBox(width: 16.w),
                        _buildReplayCard(
                          'Casual Talk',
                          '(Short Conversation)',
                          'casual_talk',
                        ),
                      ],
                    ),

                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Container(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  // Skip Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const YourInterestScreen());
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: ColorConstants.buttonColor,
                            width: 2.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: ColorConstants.buttonColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 16.w),

                  // Next Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (_isFormValid()) {
                          Get.to(() => const YourInterestScreen());
                        } else {
                          Get.snackbar(
                            'Incomplete Selection',
                            'Please select your preferences',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: _isFormValid()
                              ? ColorConstants.buttonColor
                              : ColorConstants.buttonColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(String label, String imagePath) {
    bool isSelected = selectedCharacter == label;

    // 🔍 Debug: Print image path to console
    print('Loading image: $imagePath for $label');

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCharacter = label;
          });
        },
        child: Column(
          children: [
            Container(
              width: 200.h,
              height: 200.h,
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6), // Purple background
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.transparent,
                  width: isSelected ? 3.w : 0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // 🔍 Debug: Print error details
                    print('❌ Image failed to load: $imagePath');
                    print('Error: $error');

                    // Enhanced fallback UI
                    return Container(
                      color: const Color(0xFF8B5CF6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            label == 'Male' ? Icons.man : Icons.woman,
                            color: Colors.white,
                            size: 60.sp,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            label,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Character',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // Show the attempted file path for debugging
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              'Image not found:\n${imagePath.split('/').last}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          print('✅ Image loaded successfully: $imagePath');
                          return child;
                        }
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                          child: child,
                        );
                      },
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Replay Card Widget - Same as before
  Widget _buildReplayCard(String title, String subtitle, String id) {
    bool isSelected = selectedReplay == id;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedReplay = id;
          });
        },
        child: Container(
          height: 140.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF8B5CF6).withOpacity(0.2)
                : const Color(0xFF374151),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
              width: 2.w,
            ),
          ),
          child: Column(
            children: [
              Expanded(child: _buildChatVisualization(id, isSelected)),
              SizedBox(height: 12.h),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFFD1D5DB),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFFD1D5DB)
                      : const Color(0xFF9CA3AF),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatVisualization(String replayId, bool isSelected) {
    Color bubbleColor = isSelected
        ? const Color(0xFF8B5CF6)
        : const Color(0xFF4B5563);

    if (replayId == 'interactive_story') {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              SizedBox(width: 24.w),
              Expanded(
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              SizedBox(width: 24.w),
              Expanded(
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
              SizedBox(width: 40.w),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 30.w),
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 40.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: SizedBox()),
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      );
    }
  }

  bool _isFormValid() {
    return selectedCharacter.isNotEmpty && selectedReplay.isNotEmpty;
  }
}
