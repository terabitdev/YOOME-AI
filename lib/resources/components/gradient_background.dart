// lib/widgets/gradient_background.dart
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;
  static const _gradient = LinearGradient(
    colors: [
      Color(0xFF662BC5), // Purple start
      Color(0xFF1A0B32), // Dark purple (transition)
      Colors.black, // End in black
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0], // Smooth fade starts at 50%
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: _gradient),
      child: child,
    );
  }
}
