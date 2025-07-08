import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key,
    this.hint,
    this.suffixWidgets = const [],
  });

  final String? hint;
  final List<Widget> suffixWidgets;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14.sp, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
        filled: true,
        fillColor: const Color(0xFF242424),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixWidgets.isEmpty
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: suffixWidgets
                    .asMap()
                    .entries
                    .map(
                      (entry) => Padding(
                        padding: EdgeInsets.only(
                          right: entry.key == suffixWidgets.length - 1
                              ? 8.w
                              : 4.w,
                        ),
                        child: entry.value,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
