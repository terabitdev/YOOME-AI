import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/yoome_bill_screen.dart';

class EditPersonaScreen2 extends StatefulWidget {
  const EditPersonaScreen2({super.key});

  @override
  State<EditPersonaScreen2> createState() => _EditPersonaScreen2State();
}

class _EditPersonaScreen2State extends State<EditPersonaScreen2> {
  String selectedGender = 'Female'; // Track selected gender

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
                  width: 40.w,
                  height: 40.h,
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
                SizedBox(width: 16.w),
                Text('Edit Persona', style: EPSTextStyle185001),
              ],
            ),
          ),

          // Camera Icon Overlay
          Positioned(
            left: 20,
            bottom: 420.h,
            child: Image.asset(
              'assets/images/camera.png',
              width: 53.w,
              height: 53.h,
            ),
          ),

          // Bottom Content with Gradient
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NAME', style: EPSTextStyle124002),
                        const SizedBox(height: 8),
                        Text('AR Janjua', style: EPSTextStyle145003),
                        const SizedBox(height: 4),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Gender Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender', style: EPSTextStyle145004),
                        const SizedBox(height: 16),

                        // Gender Options Row
                        Row(
                          children: [
                            _buildGenderOption('Female'),
                            const SizedBox(width: 12),
                            _buildGenderOption('Male'),
                            const SizedBox(width: 12),
                            _buildGenderOption('Other'),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Lorem Ipsum Text Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, adipiscing elit, psum .',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Save Button using RoundButton
                    RoundButton(
                      title: 'Save',
                      color: ColorConstants.buttonColor,
                      onTap: () {
                        Get.to(YoomeBillScreen());
                        Get.showSnackbar(
                          GetSnackBar(
                            message: 'Persona saved successfully!',
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.deepPurpleAccent,
                            snackPosition: SnackPosition.TOP,
                          ),
                        );
                        // Handle save action
                        print('Save tapped');
                        // You can add your save logic here
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFA259FF)
                : Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                gender,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 8, color: Color(0xFFA259FF))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
