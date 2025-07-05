import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/action_sheet_widget.dart';
import 'package:yoome_ai/resources/components/setting_toggle_card_widget.dart';
import 'package:yoome_ai/resources/components/settings_card_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/view_profile_screen.dart';

class AliasScreen extends StatefulWidget {
  const AliasScreen({super.key});
  @override
  State<AliasScreen> createState() => _AliasScreenState();
}

class _AliasScreenState extends State<AliasScreen> {
  bool autoPlayVoice = true;

  /* bottom‑sheet trigger */
  void _showMore() {
    ActionSheet.show(
      context,
      title:
          'The Alias will place the original name of the character in the chat',
      items: [
        SheetAction(
          label: 'Caden',
          onTap: () {
            /* share */
          },
        ),
        SheetActionGroup([
          SheetAction(
            label: 'Cancel',
            onTap: () {
              /* handle Cancel */
            },
            flex: 1, // optional, defaults to 1
          ),
          SheetAction(
            label: 'Save',
            onTap: () {
              /* handle Save */
            },
            flex: 1,
          ),
        ]),
      ],
    );
  }

  /* ─────────────────────────── UI ─────────────────────────── */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* 1️⃣ background */
          SizedBox.expand(
            child: Image.asset(
              'assets/images/csbackimage.png',
              fit: BoxFit.cover,
            ),
          ),

          /* 2️⃣ scrollable content */
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * .35,
                20,
                30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Character settings', style: CSSTextStyle185001),
                  SizedBox(height: 30.h),

                  Text('General', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  SettingsCard(
                    title: 'Model settings',
                    onTap: () => Get.offAll(const ViewProfileScreen()),
                  ),
                  SizedBox(height: 12.h),

                  Text('Character', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  SettingsCard(title: 'Alias', onTap: () {}),
                  SizedBox(height: 30.h),

                  Text('Chat', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  SettingsCard(title: 'Restart chat', onTap: () {}),
                  SizedBox(height: 12.h),
                  SettingsCard(title: 'Chat history', onTap: () {}),
                  SizedBox(height: 12.h),
                  SettingsToggleCard(
                    title: 'Auto-play voice',
                    badgeText: 'Plus',
                    isToggled: autoPlayVoice,
                    onToggle: (v) => setState(() => autoPlayVoice = v),
                  ),
                  SizedBox(height: 12.h),
                  SettingsCard(title: 'Background setting', onTap: () {}),
                  SizedBox(height: 12.h),
                  SettingsCard(title: 'Report', onTap: () {}),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          /* 3️⃣ toolbar (painted last → receives taps) */
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                _toolbarButton(
                  icon: Icons.arrow_back,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                _toolbarButton(icon: Icons.more_vert, onTap: _showMore),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolbarButton({
    required IconData icon,
    required VoidCallback onTap,
  }) => Container(
    width: 40.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.3),
      borderRadius: BorderRadius.circular(12),
    ),
    child: IconButton(
      icon: Icon(icon, color: Colors.white, size: 20),
      onPressed: onTap,
    ),
  );
}
