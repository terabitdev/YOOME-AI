import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/gradient_scaffold_background.dart';
import 'package:yoome_ai/resources/components/gradient_textbox.dart';
import 'package:yoome_ai/resources/components/reuseable_textfield.dart';
import 'package:yoome_ai/view/enhanced_memory_screen.dart';
import 'package:yoome_ai/view/persona_screen.dart';
import 'package:yoome_ai/view/report_screen.dart';
import 'package:yoome_ai/view/reset_screen.dart';
import 'package:yoome_ai/view/share_screen.dart';

class MatthewSupportsScreen extends StatelessWidget {
  const MatthewSupportsScreen({super.key});

  // List of image paths, labels and corresponding destination screens
  static List<Map<String, dynamic>> _imageData = [
    {
      'imageUrl': 'assets/images/enhanced.png',
      'label': 'Enhanced\nmemory',
      'screen': EnhancedMemoryScreen(),
    },
    {
      'imageUrl': 'assets/images/persona.png',
      'label': 'Persona',
      'screen': PersonaScreen(),
    },
    {
      'imageUrl': 'assets/images/reset.png',
      'label': 'Reset',
      'screen': ResetScreen(),
    },
    {
      'imageUrl': 'assets/images/share.png',
      'label': 'Share',
      'screen': ShareScreen(),
    },
    {
      'imageUrl': 'assets/images/report.png',
      'label': 'Report',
      'screen': ReportScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top-bar icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(Icons.arrow_back_ios_new_rounded),
                  _circleIcon(Icons.menu_rounded),
                ],
              ),
              SizedBox(height: 20.h),

              // First large text container
              GradientBox(
                child: Text(
                  _firstTextBlock,
                  style: TextStyle(
                    fontSize: 13.sp,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              // Second small "No Audio" container (compact size and width)
              Align(
                alignment: Alignment.centerLeft,
                child: GradientBox(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Text(
                    'No Audio',
                    style: TextStyle(fontSize: 11.sp, color: Colors.white60),
                  ),
                ),
              ),

              // Third text container (attached to No Audio container) with floating icons
              Stack(
                children: [
                  GradientBox(
                    child: Text(
                      _secondTextBlock,
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.4,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Floating share and play icons
                  Positioned(
                    bottom: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.share, color: Colors.white, size: 18.sp),
                          SizedBox(width: 12.w),
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Character info row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayato Hiroshi | Cold Prince',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '@Elara',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Switch(
                        value: true,
                        onChanged: (_) {},
                        activeColor: const Color(0xFF8466FF),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Message input field
              ReusableTextField(
                hint: 'Message Ayato Hiroshi | Cold Prince',
                suffixIcons: const [
                  Icons.mic_none_rounded,
                  Icons.grid_view_rounded,
                ],
              ),
              SizedBox(height: 24.h),

              // Bottom action buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return _actionButton(
                    imageUrl: _imageData[index]['imageUrl']!,
                    label: _imageData[index]['label']!,
                    onTap: () {
                      Get.to(_imageData[index]['screen']);
                    },
                  );
                }),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to create a round icon with subtle translucent fill
  Widget _circleIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 16.sp),
    );
  }

  // Helper to create the circular action button with image and label
  Widget _actionButton({
    required String imageUrl,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF25104A),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/nocharacter.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white70,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

// Sample text blocks to match the screenshot
const String _firstTextBlock =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.'
    '\n\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.'
    '\n\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.'
    '\n\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet.';

const String _secondTextBlock =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.';
