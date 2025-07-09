import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({
    super.key,
    this.onTap,
    this.label = 'Upload',
    this.description =
        '(Optional) Upload a reference image\nto imitate its features',
    this.height = 120,
    this.squareSize = 60,
    this.dashColor = const Color(0xFFA259FF),
    this.squareFill = const Color(0x33A259FF),
    this.icon = Icons.upload,
    this.selectedImage,
  });

  final VoidCallback? onTap;
  final String label;
  final String description;
  final double height;
  final double squareSize;
  final Color dashColor;
  final Color squareFill;
  final IconData icon;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF5E3F93), width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ──────── Dashed Inner Upload Square ────────
            GestureDetector(
              onTap: onTap,
              child: _DashedBorder(
                color: dashColor,
                child: Container(
                  height: 111.h,
                  width: 94.w,
                  decoration: BoxDecoration(
                    color: squareFill,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            selectedImage!,
                            width: 94.w,
                            height: 111.h,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, color: dashColor, size: 30),
                            SizedBox(height: 4.h),
                            Text(
                              label,
                              style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // ──────── Description Text ────────
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(.5),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────── Dashed Border Decoration ────────
class _DashedBorder extends StatelessWidget {
  const _DashedBorder({
    required this.child,
    required this.color,
    this.strokeWidth = 2,
    this.dashLength = 5,
    this.dashSpace = 3,
  });

  final Widget child;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
        dashSpace: dashSpace,
      ),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  _DashedPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashSpace,
  });

  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(15),
        ),
      );

    final dashed = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashLength;
        dashed.addPath(
          metric.extractPath(
            distance,
            next > metric.length ? metric.length : next,
          ),
          Offset.zero,
        );
        distance = next + dashSpace;
      }
    }

    canvas.drawPath(dashed, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
