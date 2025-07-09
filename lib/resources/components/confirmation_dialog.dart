import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.confirmText,
    this.cancelText = 'Cancel',
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConstants.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      if (onCancel != null) onCancel!();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(cancelText, style: RSTextStyle16500),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(confirmText, style: MSTextStyle13500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
