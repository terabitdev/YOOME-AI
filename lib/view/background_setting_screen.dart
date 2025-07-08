import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/create_avatar_screen.dart';
import 'package:yoome_ai/view/create_avatar_screen2.dart';

class BackgroundSettingScreen extends StatefulWidget {
  const BackgroundSettingScreen({super.key});

  @override
  State<BackgroundSettingScreen> createState() =>
      _BackgroundSettingScreenState();
}

class _BackgroundSettingScreenState extends State<BackgroundSettingScreen> {
  int selectedIndex = 0; // Track selected background option

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text('Background Settings', style: LTextStyle18500),
                      ],
                    ),
                    const SizedBox(height: 34),
                    // None option
                    _buildBackgroundOption(
                      index: 0,
                      child: const Center(
                        child: Text(
                          'None',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Image background option
                    _buildBackgroundOption(
                      index: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              // Replace with your actual image
                              image: AssetImage('assets/images/bssimage1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Create option with Ultra badge
                    _buildBackgroundOption(
                      index: 2,
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/bssimage2.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'create',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Stack(
                              alignment: Alignment
                                  .center, // <-- put next child dead‑centre
                              children: [
                                Image.asset(
                                  'assets/images/bssimage3.png',
                                  fit: BoxFit
                                      .cover, // optional, keeps the whole image
                                ),
                                Text(
                                  'Ultra',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom buttons
              SafeArea(
                child: DualActionButtons(
                  leftLabel: 'Cancel',
                  rightLabel: 'Confirm',
                  leftIsPrimary: false,
                  onLeftTap: () => Navigator.pop(context),
                  onRightTap: () {
                    Get.to(CreateAvatarScreen());
                    // Handle confirm action
                    print('Selected background option: $selectedIndex');
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundOption({required int index, required Widget child}) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.purple.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          color: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
