import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Multiline, border‑only text input that automatically grows to the height you
/// pass in (120 .h by default).  Handy for “bio”, “about”, or any note field.
///
/// ```dart
/// BorderedMultilineInput(
///   controller: _bioController,
///   hint: 'Add your bio',
/// )
/// ```
class BorderedMultilineInput extends StatelessWidget {
  const BorderedMultilineInput({
    super.key,
    required this.controller,
    this.hint = '',
    this.height = 120,
    this.radius = 16,
    this.borderOpacity = .3,
    this.textStyle,
    this.hintStyle,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
  });

  /// Controls the text inside the field.
  final TextEditingController controller;

  /// Placeholder text.
  final String hint;

  /// Container height before converting with `.h`.
  final double height;

  /// Corner radius before `.r`.
  final double radius;

  /// 0–1 opacity applied to [borderColor] when not focused.
  final double borderOpacity;

  /// Override the default text or hint style if you need.
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  /// Inner padding.
  final EdgeInsets padding;

  /// Colors.
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(
          color: Color(0xFFA06AF9).withOpacity(borderOpacity),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style:
            textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              hintStyle ??
              TextStyle(
                color: Colors.white.withOpacity(.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
