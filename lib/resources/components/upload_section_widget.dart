import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ----------------------------------------------------------------------------
/// Reusable upload‑area widget that exactly matches the design shown
/// in the screenshot: a dashed outer card and a dashed inner square with
/// an icon + label, followed by an optional description.
/// ----------------------------------------------------------------------------
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
  });

  /// Callback when the inner square is tapped.
  final VoidCallback? onTap;

  /// Text underneath the icon inside the square.
  final String label;

  /// Helper text shown to the right.
  final String description;

  /// Overall container height *before* `.h` conversion.
  final double height;

  /// Size of the inner dashed square *before* `.w/.h` conversion.
  final double squareSize;

  /// Stroke color for both dashed borders.
  final Color dashColor;

  /// Fill colour for the square behind the icon (uses 0x33 = 20 % opacity).
  final Color squareFill;

  /// Icon displayed in the square.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(.3)),
      ),
      child: _DashedBorder(
        color: dashColor,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ───────────────────────── inner square ──────────────────────
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
                    child: Column(
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
              // ───────────────────────── description ───────────────────────
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
      ),
    );
  }
}

// ----------------------------------------------------------------------------
// Private dashed border helper; keeps this widget self‑contained.
// ----------------------------------------------------------------------------
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
