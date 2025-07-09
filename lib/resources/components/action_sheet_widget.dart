import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class CardActionSheet extends StatelessWidget {
  const CardActionSheet({
    super.key,
    required this.title,
    required this.content, // the single “card” child
    required this.onConfirm,
    this.onCancel,
    this.cancelLabel = 'Cancel',
    this.confirmLabel = 'Confirm',
    this.sheetColor = Colors.black,
    this.cardColor = Colors.black,
    this.strokeColor = const Color(0xFF5E3F93),
  });

  /// Text shown at the very top of the sheet.
  final String title;

  /// Anything you’d like to place in the card: `TextField`, `Column`, etc.
  final Widget content;

  /// Buttons & callbacks
  final String cancelLabel;
  final String confirmLabel;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;

  /// Styling
  final Color sheetColor;
  final Color cardColor;
  final Color strokeColor;

  /* ────────────────────────────── static helper ───────────────────────────── */

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String cancelLabel = 'Cancel',
    String confirmLabel = 'Confirm',
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CardActionSheet(
        title: title,
        content: content,
        cancelLabel: cancelLabel,
        confirmLabel: confirmLabel,
        onCancel: onCancel,
        onConfirm: onConfirm,
      ),
    );
  }

  /* ───────────────────────────────── build ───────────────────────────────── */

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: sheetColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(color: strokeColor.withOpacity(.5), width: 1.w),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // drag handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(title, style: VTPSTextStyle145005),
                    SizedBox(height: 20.h),

                    // the single “card”
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: strokeColor.withOpacity(.5)),
                      ),
                      child: content,
                    ),

                    SizedBox(height: 24.h),

                    // dual action buttons
                    DualActionButtons(
                      leftLabel: cancelLabel,
                      rightLabel: confirmLabel,
                      onLeftTap: () {
                        Navigator.pop(ctx);
                        onCancel?.call();
                      },
                      onRightTap: () {
                        Navigator.pop(ctx);
                        onConfirm();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
