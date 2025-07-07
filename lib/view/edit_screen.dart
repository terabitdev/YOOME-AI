import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/bio_textfield_widget.dart';
import 'package:yoome_ai/resources/components/round_button.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String selectedGender = 'Female'; // Track selected gender
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image - Full Screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/csbackimage.png', // Use your anime character image
              fit: BoxFit.cover,
            ),
          ),

          // Top App Bar - Only Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: Container(
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
          ),

          // Camera Icon Overlay
          Positioned(
            left: 15.w,
            bottom: 480.h,
            child: Image.asset(
              'assets/images/camear1.png',
              width: 91.w,
              height: 91.h,
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
                        Text(
                          'NAME',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'AR Janjua',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                        Text(
                          'Your Gender',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Gender Options Row
                        Row(
                          children: [
                            Expanded(child: _buildGenderOption('Female')),
                            const SizedBox(width: 12),
                            Expanded(child: _buildGenderOption('Male')),
                            const SizedBox(width: 12),
                            Expanded(child: _buildGenderOption('Other')),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Bio Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Bio Text Field
                        BorderedMultilineInput(
                          controller: _bioController,
                          hint: 'Add your bio',
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Save Button using RoundButton
                    RoundButton(
                      title: 'Save',
                      color: ColorConstants.buttonColor,
                      onTap: () {},
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
          color: isSelected ? const Color(0xFFA259FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
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
            const SizedBox(width: 6),
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

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }
}
