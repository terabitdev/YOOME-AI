import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/action_sheet_widget.dart';
import 'package:yoome_ai/resources/components/character_setting_card_widget.dart';
import 'package:yoome_ai/resources/components/character_setting_toggle_card_widget.dart';
import 'package:yoome_ai/resources/components/confirmation_dialog.dart';
import 'package:yoome_ai/resources/components/setting_toggle_card_widget.dart';
import 'package:yoome_ai/resources/components/settings_card_widget.dart';
import 'package:yoome_ai/resources/components/textfield_dialog_box.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/background_setting_screen.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';
import 'package:yoome_ai/view/report_screen.dart';
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
    CardActionSheet.show(
      context,
      title: 'This Alias will replace the original name.',
      content: TextField(
        decoration: const InputDecoration(
          hintText: 'Caden',
          border: InputBorder.none,
        ),
        style: VTPSTextStyle124006,
      ),
      onConfirm: () {
        // do something with the entered alias…
      },
      onCancel: () {
        // optional – extra logic if Cancel is pressed
      },
    );
  }

  void _More() {
    CardActionSheet.show(
      context,
      title: 'This Alias will replace the original name.',
      content: TextField(
        decoration: const InputDecoration(
          hintText: 'Caden',
          border: InputBorder.none,
        ),
        style: VTPSTextStyle124006,
      ),
      onConfirm: () {
        // do something with the entered alias…
      },
      onCancel: () {
        // optional – extra logic if Cancel is pressed
      },
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
                  CharacterSettingsCard(
                    title: 'Model settings',
                    onTap: () => Get.offAll(const ViewProfileScreen()),
                  ),
                  SizedBox(height: 12.h),

                  Text('Character', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  CharacterSettingsCard(
                    title: 'Alias',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => InputDialog(
                          title: 'Enter alias name',
                          confirmText: 'Save',
                          onConfirm: (aliasValue) {
                            print('Alias entered: $aliasValue');
                            // You can now update your state or controller
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),

                  Text('Chat', style: CSSTextStyle144002),
                  SizedBox(height: 12.h),
                  CharacterSettingsCard(
                    title: 'Restart chat',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => ConfirmationDialog(
                          title: 'Do you want to restart the chat?',
                          confirmText: 'New Chat',
                          onConfirm: () {
                            // Your action here
                            Get.to(MatthewSupportsScreen());
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  CharacterSettingsCard(title: 'Chat history', onTap: () {}),
                  SizedBox(height: 12.h),
                  CharacterSettingsToggleCard(
                    title: 'Auto-play voice',
                    badgeText: 'Plus',
                    isToggled: autoPlayVoice,
                    onToggle: (v) => setState(() => autoPlayVoice = v),
                  ),
                  SizedBox(height: 12.h),
                  CharacterSettingsCard(
                    title: 'Background setting',
                    onTap: () {
                      Get.to(const BackgroundSettingScreen());
                    },
                  ),
                  SizedBox(height: 12.h),
                  CharacterSettingsCard(
                    title: 'Report',
                    onTap: () {
                      Get.to(const ReportScreen());
                    },
                  ),
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
