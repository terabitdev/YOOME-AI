// 3️⃣  REUSABLE: SEMI‑TRANSPARENT PURPLE GRADIENT BOX
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.child,
    this.height,
    this.borderRadius,
    this.padding,
  });

  final Widget child;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  static const _boxGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 26, 1, 43), // Dark color (deep midnight purple/black)
      Color.fromARGB(255, 108, 44, 245), // Purple in the middle
      Color.fromARGB(
        255,
        26,
        1,
        43,
      ), // Bright color (light purple) at the bottom-right
    ],
    stops: [0.0, 0.5, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: _boxGradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
      child: child,
    );
  }
}
