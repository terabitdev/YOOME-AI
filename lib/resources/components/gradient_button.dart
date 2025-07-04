import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.label,
    required this.onPressed,
    super.key,
  });
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 154.w,
    height: 48.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB56AFF), Color(0xFF7B59FF)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        child: Center(child: Text(label, style: PSGBTextStyle14700)),
      ),
    ),
  );
}
