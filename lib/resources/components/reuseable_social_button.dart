import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color bgColor;
  final Color iconColor;

  const SocialButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.bgColor = const Color(0xFF1A1A1A),
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
