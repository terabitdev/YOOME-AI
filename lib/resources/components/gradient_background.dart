// lib/widgets/gradient_background.dart
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  static const _gradient = LinearGradient(
    colors: [Color.fromARGB(255, 102, 43, 197), Colors.black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [],
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
