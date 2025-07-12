import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/config/splash_services.dart';
import 'package:yoome_ai/resources/components/action_sheet_widget.dart';
import 'package:yoome_ai/resources/components/setting_toggle_card_widget.dart';
import 'package:yoome_ai/resources/components/settings_card_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/about_screen.dart';
import 'package:yoome_ai/view/bug_report_screen.dart';
import 'package:yoome_ai/view/content_preferences.dart';
import 'package:yoome_ai/view/select_language_screen.dart';
// import 'package:yoome_ai/resources/constants/app_style.dart'; // Uncomment if you have this

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  /* bottom‑sheet trigger */
  void _showMore() {
    CardActionSheet.show(
      context,
      title: 'Invitation Code',
      content: SizedBox(
        height: 48.h,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter your code',
            border: InputBorder.none,
          ),
          style: VTPSTextStyle124006,
        ),
      ),
      onConfirm: () {
        // do something with the entered alias…
      },
      onCancel: () {
        // optional – extra logic if Cancel is pressed
      },
    );
  }

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
                Text('Setting', style: SSTextStyle18500),
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
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    // Personalization Section
                    _buildSectionTitle('Personalization'),
                    SizedBox(height: 12.h),
                    SettingsCard(
                      title: 'Content Preferences',
                      onTap: () {
                        Get.to(const ContentPreferences());
                      },
                    ),
                    SizedBox(height: 8.h),
                    SettingsCard(
                      title: 'Language (Follow system language)',
                      onTap: () {
                        Get.to(const SelectLanguageScreen());
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Notifications Section
                    _buildSectionTitle('Notifications'),
                    SizedBox(height: 12.h),
                    SettingsToggleCard(
                      title: 'Enable notifications',
                      isToggled: enableNotifications,
                      onToggle: (value) {
                        setState(() {
                          enableNotifications = value;
                        });
                      },
                    ),
                    SizedBox(height: 8.h),
                    SettingsToggleCard(
                      title: 'New message vibration',
                      isToggled: newMessageVibration,
                      onToggle: (value) {
                        setState(() {
                          newMessageVibration = value;
                        });
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Chat Section
                    _buildSectionTitle('Chat'),
                    SizedBox(height: 12.h),
                    SettingsToggleCard(
                      title: 'Auto-play voice',
                      badgeText: 'Plus',
                      isToggled: autoPlayVoice,
                      onToggle: (value) {
                        setState(() {
                          autoPlayVoice = value;
                        });
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Feedback Section
                    _buildSectionTitle('Feedback'),
                    SizedBox(height: 12.h),
                    SettingsCard(
                      title: 'Bug report',
                      onTap: () {
                        Get.to(const BugReportScreen());
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Account Section
                    _buildSectionTitle('Account'),
                    SizedBox(height: 12.h),
                    SettingsCard(
                      title: 'Logout',
                      onTap: () {
                        SessionHelper.logoutUser();
                      },
                    ),
                    SizedBox(height: 8.h),
                    SettingsCard(
                      title: 'About',
                      onTap: () {
                        Get.to(const AboutScreen());
                      },
                    ),
                    SizedBox(height: 8.h),
                    SettingsCard(
                      title: 'Invite code',
                      onTap: () {
                        _showMore();
                      },
                    ),

                    SizedBox(height: 32.h),

                    // Version
                    Center(
                      child: Text(
                        'v1.1.1',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: SSTextStyle14400);
  }
}
