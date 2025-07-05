import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  // Updated gradient with diagonal transition: dark -> purple -> bright
  static const _backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 26, 1, 43), // Dark color (deep midnight purple/black)
      Color(0xFF6C2CF5), // Purple in the middle
      Color.fromARGB(
        255,
        16,
        1,
        26,
      ), // Bright color (light purple) at the bottom-right
    ],
    stops: [0.0, 0.5, 1.0], //Smooth transition with purple in the middle
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: _backgroundGradient),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(child: child),
    );
  }
}
