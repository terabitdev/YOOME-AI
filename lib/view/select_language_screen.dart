import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String selectedLanguage = 'Default (Follow system language)';

  final List<String> languages = [
    'English',
    'Default (Follow system language)',
    'Español',
    'Français',
    'Italiano',
    'Português',
    'Deutsch',
    'Türkçe',
    'Polski',
    'Русский',
    'Bahasa Indonesia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 52.h),
            child: Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
                SizedBox(width: 16.w),
                Text('Select Language', style: SSTextStyle18500),
              ],
            ),
          ),

          // Main container with languages
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                children: [
                  // Language list
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: languages.map((language) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: _buildLanguageOption(language),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Bottom buttons
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: DualActionButtons(
                      leftLabel: 'Cancel',
                      rightLabel: 'Select',
                      leftIsPrimary: false,
                      onLeftTap: () {
                        // Handle cancel
                        print('Cancel tapped');
                        Navigator.pop(context);
                      },
                      onRightTap: () {
                        // Handle select action
                        print('Selected language: $selectedLanguage');
                        Navigator.pop(context);
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

  Widget _buildLanguageOption(String language) {
    bool isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        // setState(() {
        //   selectedLanguage = language;
        // });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF6B46C1) : Color(0xFF2D1B69),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Color(0xFF8B5DFF) : Color(0xFF6B46C1),
            width: 1,
          ),
        ),
        child: Text(
          language,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
