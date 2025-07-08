import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/components/settings_card_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool enableNotifications = true;
  bool newMessageVibration = true;
  bool autoPlayVoice = false;

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
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Text('About', style: SSTextStyle18500),
              ],
            ),
          ),

          // Scrollable content
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                children: [
                  // Settings cards section
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          SettingsCard(
                            title: 'Terms And Conditions',
                            onTap: () {},
                          ),
                          SizedBox(height: 8.h),
                          SettingsCard(title: 'Privacy Policy', onTap: () {}),
                          SizedBox(height: 8.h),
                          SettingsCard(title: 'Delete Account', onTap: () {}),
                          SizedBox(height: 24.h), // Extra space after cards
                        ],
                      ),
                    ),
                  ),

                  // Bottom buttons with spacing
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: DualActionButtons(
                      leftLabel: 'Select',
                      rightLabel: 'Cancel',
                      leftIsPrimary: false,
                      onLeftTap: () {
                        // Handle select
                        print('Select tapped');
                      },
                      onRightTap: () {
                        // Handle cancel action
                        print('Cancel tapped');
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
}
