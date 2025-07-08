// ────────────────── HEADER ──────────────────
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/setting_screen.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    required this.avatarUrl,
    required this.username,
    required this.uid,
    super.key,
  });

  final String avatarUrl;
  final String username;
  final String uid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 140, // enough room for both layers
      child: Stack(
        children: [
          // ─────────── Icons (48 px from top) ───────────
          Positioned(
            top: 48.h,
            right: 24.w,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/discord2.png',
                  width: 16.w,
                  height: 16.h,
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () {
                    Get.to(SettingScreen());
                  },
                  child: Image.asset(
                    'assets/images/settings.png',
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
              ],
            ),
          ),

          // ───────── Avatar + name + UID (81 px from top) ─────────
          Positioned(
            top: 70.h,
            left: 24.w,
            right: 24.w, // so the row can calculate `Spacer()` correctly
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: PSTextStyle15400),
                    SizedBox(height: 2.h),
                    Text(
                      'UID:$uid',
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: ColorConstants.lightGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // keeps future additions aligned
                SizedBox(width: 8.w),
                Image.asset(
                  'assets/images/make.png',
                  width: 14.w,
                  height: 14.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
