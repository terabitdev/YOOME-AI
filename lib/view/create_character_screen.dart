import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/create_avatar_screen2.dart';
import 'package:yoome_ai/view/create_character_screen_2.dart';

/// Call this inside `showModalBottomSheet` or `Get.bottomSheet`.
class CreateCharacterSheet extends StatelessWidget {
  const CreateCharacterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // colours that match your previous palette
    // const outline = Color(0xFF7B59FF);
    // const tileBg = Color(0xFF18003A);

    return Padding(
      // keep some air around the panel
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(26),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFA06AF9), width: 1),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // only as tall as needed
            children: [
              const SizedBox(height: 12),
              Container(
                width: 64.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Create character',
                    style: PSTextStyle14400,
                  ), // your own text style
                ),
              ),

              const SizedBox(height: 24),
              _ModeTile(
                title: 'Quick mode',
                onTap: () {
                  Get.to(CreateCharacterScreen2());
                },
              ),
              const SizedBox(height: 16),
              _ModeTile(
                title: 'Expert mode',
                onTap: () {
                  Get.to(CreateAvatarScreen2());
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}

/// Re‑usable row‑style button inside the sheet
class _ModeTile extends StatelessWidget {
  const _ModeTile({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // const tileBg = Color(0xFF18003A);
    // const outline = Color(0xFF7B59FF);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFF18003A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFF5E3F93), width: 1.w),
          ),
          child: Row(
            children: [
              Text(title, style: PSTextStyle14400),
              const Spacer(),
              const Icon(Icons.chevron_right, size: 20, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
