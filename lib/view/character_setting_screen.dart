import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterSettingScreen extends StatefulWidget {
  const CharacterSettingScreen({super.key});

  @override
  State<CharacterSettingScreen> createState() => _CharacterSettingScreenState();
}

class _CharacterSettingScreenState extends State<CharacterSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image - Full Screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/backimage.png', // Use your anime character image
              fit: BoxFit.cover,
            ),
          ),

          // Top App Bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
