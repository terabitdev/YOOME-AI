import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class CharactersReuseableCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CharactersReuseableCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: CCSTextStyle12400),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF888888),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
