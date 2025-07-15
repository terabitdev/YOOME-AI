import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderOptionWidget extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final void Function(String) onTap;

  const GenderOptionWidget({
    Key? key,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () => onTap(gender),
      child: Container(
        width: 100.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFA259FF)
                : Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                gender,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFA259FF)
                      : Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 8, color: Color(0xFFA259FF))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
