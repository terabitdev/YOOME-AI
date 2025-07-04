import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, this.hint, this.suffixIcons = const []});

  final String? hint;
  final List<IconData> suffixIcons;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14.sp, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
        filled: true,
        fillColor: const Color(0xFF26104F),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcons.isEmpty
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < suffixIcons.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                        right: i == suffixIcons.length - 1 ? 8.w : 4.w,
                      ),
                      child: Icon(suffixIcons[i], color: Colors.white),
                    ),
                ],
              ),
      ),
    );
  }
}
