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

// 5️⃣  THE SCREEN ITSELF
class MatthewSupportsScreen extends StatelessWidget {
  const MatthewSupportsScreen({super.key});
  // List of image paths and corresponding destination screens
  static List<Map<String, dynamic>> _imageData = [
    {
      'imageUrl': 'assets/images/enhanced.png',
      'screen': EnhancedMemoryScreen(),
    },
    {'imageUrl': 'assets/images/persona.png', 'screen': PersonaScreen()},
    {'imageUrl': 'assets/images/reset.png', 'screen': ResetScreen()},
    {'imageUrl': 'assets/images/share.png', 'screen': ShareScreen()},
    {'imageUrl': 'assets/images/report.png', 'screen': ReportScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // the gradient sits behind via our wrapper
      body: GradientBackground(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top‑bar icons ───────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(Icons.arrow_back_ios_new_rounded),
                  _circleIcon(Icons.menu_rounded),
                ],
              ),
              SizedBox(height: 20.h),

              // Long text container ────────────────────────────────────────
              GradientBox(
                child: Text(
                  _dummyLorem,
                  style: TextStyle(
                    fontSize: 13.sp,
                    height: 1.35,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Small play/share container ────────────────────────────────
              GradientBox(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No Audio',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white60),
                    ),
                    Row(
                      children: [
                        Icon(Icons.share, color: Colors.white, size: 20.sp),
                        SizedBox(width: 12.w),
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // Label + subtext + button row ───────────────────────────────
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
                  Switch(
                    value: true,
                    onChanged: (_) {},
                    activeColor: const Color(0xFF8466FF),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.people_alt_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Reusable text field ───────────────────────────────────────
              ReusableTextField(
                hint: 'Message Ayato Hiroshi | Cold Prince',
                suffixIcons: const [
                  Icons.mic_none_rounded,
                  Icons.grid_view_rounded,
                ],
              ),
              SizedBox(height: 24.h),

              // Row of image boxes ────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return _imageCard(
                    imageUrl: _imageData[index]['imageUrl']!,
                    onTap: () {
                      Get.to(_imageData[index]['screen']);
                    },
                  );
                }),
              ),
              SizedBox(height: 24.h),
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

  // Helper to create the small dark‑purple card with an image
  Widget _imageCard({required String imageUrl, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.w,
        height: 45.h,
        padding: EdgeInsets.all(
          2.w,
        ), // Padding between image and container border
        decoration: BoxDecoration(
          color: const Color(0xFF25104A),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Image.asset(
          height: 21.h,
          width: 21.w,
          imageUrl,

          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/nocharacter.png', // Fallback image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Sample lorem text so the widget has something to render
const String _dummyLorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.'
    '\n\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.'
    '\n\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.';
