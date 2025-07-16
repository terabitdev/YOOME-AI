import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/profile_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/gradient_button.dart';
import 'package:yoome_ai/resources/components/profile_header.dart';
import 'package:yoome_ai/resources/components/profile_helpers.dart';
import 'package:yoome_ai/view/create_character_screen3.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Column(
        children: [
          // ───────── Fixed HEADER ─────────
          Obx(
            () => HeaderRow(
              avatarUrl: controller.photoUrl.value, // ✅ Use updated photoUrl
              username: controller.username.value,
              uid: controller.uid.value,
            ),
          ),

          // ───────── Scrollable Main Content ─────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 22.h),
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
                        Obx(
                          () => Subtitle(
                            controller.bio.value.isNotEmpty
                                ? controller.bio.value
                                : 'No bio yet',
                          ),
                        ),
                        SizedBox(height: 22.h),
                        StatsRow(),
                        SizedBox(height: 28.h),
                        const ActionRow(),
                        SizedBox(height: 32.h),

                        // ───────── Character Panel ─────────
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
                                    Get.to(() => CreateCharacterScreen3());
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
          ),
        ],
      ),
    );
  }
}
