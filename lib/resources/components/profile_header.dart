import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/profile_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/edit_screen.dart';
import 'package:yoome_ai/view/setting_screen.dart';

class HeaderRow extends GetView<ProfileController> {
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
      height: 140,
      child: Stack(
        children: [
          // ────── Settings Icon ──────
          Positioned(
            top: 48.h,
            right: 24.w,
            child: InkWell(
              onTap: () => Get.to(const SettingScreen()),
              child: Image.asset(
                'assets/images/settings.png',
                width: 14.w,
                height: 14.h,
              ),
            ),
          ),

          // ────── Avatar + Info + Edit Icon ──────
          Positioned(
            top: 70.h,
            left: 24.w,
            right: 24.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Avatar with fallback
                Obx(() {
                  return CircleAvatar(
                    radius: 32,
                    backgroundImage: controller.photoUrl.value.isNotEmpty
                        ? NetworkImage(controller.photoUrl.value)
                        : AssetImage('assets/images/profile.png')
                              as ImageProvider,
                  );
                }),

                SizedBox(width: 12.w),

                // Username and UID
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username.isNotEmpty ? username : 'No Name',
                        style: PSTextStyle15400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'UID: $uid',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: ColorConstants.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit Icon
                InkWell(
                  onTap: () => Get.to(EditScreen()),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Image.asset(
                      'assets/images/make.png',
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
