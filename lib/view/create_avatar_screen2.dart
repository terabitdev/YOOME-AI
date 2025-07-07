import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/bio_textfield_widget.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';
import 'package:yoome_ai/resources/components/upload_section_widget.dart';

class CreateAvatarScreen2 extends StatefulWidget {
  const CreateAvatarScreen2({super.key});

  @override
  State<CreateAvatarScreen2> createState() => _CreateAvatarScreen2State();
}

class _CreateAvatarScreen2State extends State<CreateAvatarScreen2> {
  final TextEditingController _characterController = TextEditingController();
  String selectedImageStyle = 'Tinder Style';

  // Image style data
  final List<Map<String, String>> imageStyles = [
    {'image': 'assets/images/imagestyle1.png'},
    {'image': 'assets/images/imagestyle2.png'},
    {'image': 'assets/images/imagestyle3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 52.h, 24.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Create Avatar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Character definition section
                    Text(
                      'Reference Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Upload section with dashed border
                    UploadSection(),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        _buildGenderOption('Male'),
                        SizedBox(width: 12.w),
                        _buildGenderOption('Female'),
                        SizedBox(width: 12.w),
                        _buildGenderOption('Other'),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    BorderedMultilineInput(
                      controller: _characterController,
                      hint: 'Describe a Content of the Avatar.....',
                    ),

                    SizedBox(height: 20.h),

                    // Image Style section
                    Text(
                      'Image Style',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Horizontal scrollable image styles
                    SizedBox(
                      height: 160.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageStyles.length,
                        itemBuilder: (context, index) {
                          return _buildImageStyleCard(index);
                        },
                      ),
                    ),

                    SizedBox(height: 12.h),
                    Center(
                      child: Text(
                        'Upload Character',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Continue Button
                    RoundButton(
                      title: 'Continue',
                      color: ColorConstants.buttonColor,
                      onTap: () {
                        print('Character: ${_characterController.text}');
                        print('Selected Style: $selectedImageStyle');
                      },
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageStyleCard(int index) {
    final style = imageStyles[index];
    final isSelected = selectedImageStyle == style['name'];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageStyle = style['name']!;
        });
      },
      child: Container(
        width: 140.w,
        margin: EdgeInsets.only(
          right: index == imageStyles.length - 1 ? 0 : 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFA259FF)
                : Colors.white.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                  image: DecorationImage(
                    image: AssetImage(style['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Label container
          ],
        ),
      ),
    );
  }
}

Widget _buildGenderOption(String gender) {
  var selectedGender = 'Male';
  final isSelected = selectedGender == gender;

  return GestureDetector(
    onTap: () {
      selectedGender = gender;
    },
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
