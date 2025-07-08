import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/gradient_button.dart';
import 'package:yoome_ai/resources/components/profile_header.dart';
import 'package:yoome_ai/resources/components/profile_helpers.dart';
import 'package:yoome_ai/view/create_character_screen_2.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // ───────── HEADER ─────────
            const HeaderRow(
              avatarUrl: 'https://picsum.photos/id/64/200/200',
              username: 'Demod - Enimy',
              uid: '5F6XMUB64',
            ),

            SizedBox(height: 22.h),

            // ───────── PROFILE CARD + CHARACTER SHEET ─────────
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
                border: Border.all(
                  color: ColorConstants.lightGrey.withOpacity(.25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 14.h),
                  const Subtitle('Tell us a bit about yourself'),
                  SizedBox(height: 22.h),
                  const StatsRow(),
                  SizedBox(height: 28.h),
                  const ActionRow(),
                  SizedBox(height: 32.h),

                  // purple sub‑panel
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                    child: Container(
                      width: double.infinity,
                      color: ColorConstants.violetPanel,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
                      child: Column(
                        children: [
                          const Subtitle('Character'),
                          SizedBox(height: 60.h),
                          Image.asset(
                            'assets/images/nocharacter.png',
                            width: 114.w,
                            height: 114.h,
                          ),
                          SizedBox(height: 24.h),
                          const Subtitle('No Character yet'),
                          SizedBox(height: 36.h),
                          GradientButton(
                            label: 'Create',
                            onPressed: () {
                              Get.to(
                                () => CreateCharacterScreen2(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
