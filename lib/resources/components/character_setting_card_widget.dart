// Reusable Settings Card Widget
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class CharacterSettingsCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CharacterSettingsCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Color.fromRGBO(65, 7, 161, 0.21),
          borderRadius: BorderRadius.circular(11.r),
          border: Border.all(color: Color.fromARGB(255, 98, 79, 185), width: 1),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title, style: CSSTextStyle124003)),
            Icon(
              Icons.chevron_right,
              color: Colors.white.withOpacity(0.6),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
