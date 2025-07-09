import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoome_ai/resources/constants/app_images.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class GoogleRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color color;

  const GoogleRoundButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.h),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Google Icon
                    SvgPicture.asset(
                      AppImages.google,
                      height: 24.h, // Adjust the size of the Google icon
                      width: 24.w,
                    ),
                    SizedBox(width: 10.h),
                    // Button Text
                    Text(title, style: GbuttonTextStyle14500White),
                  ],
                ),
        ),
      ),
    );
  }
}
