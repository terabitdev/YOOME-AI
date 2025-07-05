// Reusable Settings Toggle Card Widget
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class SettingsToggleCard extends StatelessWidget {
  final String title;
  final String? badgeText;
  final bool isToggled;
  final ValueChanged<bool> onToggle;

  const SettingsToggleCard({
    Key? key,
    required this.title,
    this.badgeText,
    required this.isToggled,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 19, 58).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color.fromARGB(255, 98, 79, 185), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(title, style: CSSTextStyle124003),
                if (badgeText != null) ...[
                  SizedBox(width: 8.w),
                  Container(
                    width: 43.w,
                    height: 19.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF7B2CBF),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(badgeText!, style: CSSTextStyle124003),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: isToggled,
            onChanged: onToggle,
            activeColor: Color(0xFFA259FF),
            activeTrackColor: Color(0xFFA259FF).withOpacity(0.3),
            inactiveThumbColor: Colors.white.withOpacity(0.6),
            inactiveTrackColor: Colors.white.withOpacity(0.2),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
