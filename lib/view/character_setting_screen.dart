import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:yoome_ai/resources/components/setting_toggle_card_widget.dart';
import 'package:yoome_ai/resources/components/settings_card_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/alias_screen.dart';
import 'package:yoome_ai/view/background_setting_screen.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';
import 'package:yoome_ai/view/report_screen.dart';
import 'package:yoome_ai/view/subscribe_screen.dart';
import 'package:yoome_ai/view/view_profile_screen.dart';

class CharacterSettingScreen extends StatefulWidget {
  const CharacterSettingScreen({super.key});

  @override
  State<CharacterSettingScreen> createState() => _CharacterSettingScreenState();
}

class _CharacterSettingScreenState extends State<CharacterSettingScreen> {
  bool autoPlayVoice = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/csbackimage.png', // Use your anime character image
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onPressed: () {
                      Get.to(MatthewSupportsScreen());
                    },
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.35,
                20,
                30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Character settings', style: CSSTextStyle185001),
                  SizedBox(height: 30.h),
                  Text('Character', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'View the profile',
                    onTap: () {
                      Get.to(const ViewProfileScreen());
                    },
                  ),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Alias',
                    onTap: () {
                      Get.to(const AliasScreen());
                    },
                  ),
                  SizedBox(height: 30.h),
                  // Chat Section
                  Text('Chat', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Restart chat',
                    onTap: () {
                      // Handle restart chat
                    },
                  ),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Chat history',
                    onTap: () {
                      // Handle chat history
                    },
                  ),
                  SizedBox(height: 12.h),
                  SettingsToggleCard(
                    title: 'Auto-play voice',
                    badgeText: 'Plus',
                    isToggled: autoPlayVoice,
                    onToggle: (value) {
                      Get.to(SubscribeScreen());
                    },
                  ),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Background setting',
                    onTap: () {
                      Get.to(BackgroundSettingScreen());
                    },
                  ),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Report',
                    onTap: () {
                      Get.to(ReportScreen());
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
