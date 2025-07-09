import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String imagePath; // Image asset path
  final VoidCallback onTap;
  final Color bgColor;

  const SocialButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.bgColor = const Color(0xFF1A1A1A),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 98.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 28.w,
            height: 28.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
