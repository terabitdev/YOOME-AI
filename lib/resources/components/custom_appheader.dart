import 'package:flutter/material.dart';

class CustomAppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppHeader({Key? key, required this.title, this.onBackPressed})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 52),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackPressed ?? () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
