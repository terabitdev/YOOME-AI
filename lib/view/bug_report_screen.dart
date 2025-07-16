import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/bio_textfield_widget.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/components/upload_section_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class BugReportScreen extends StatefulWidget {
  const BugReportScreen({super.key});

  @override
  State<BugReportScreen> createState() => _BugReportScreenState();
}

class _BugReportScreenState extends State<BugReportScreen> {
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
      body: Column(
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
                Text('Bug Report', style: SSTextStyle18500),
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
                    'Describe the bug you encountered',
                    style: SSTextStyle14400,
                  ),
                  SizedBox(height: 12.h),
                  BorderedMultilineInput(
                    controller: _characterController,
                    hint: 'Describe a Content of the Avatar.....',
                  ),

                  SizedBox(height: 20.h),
                  Text('Add Screenshot', style: SSTextStyle14400),
                  SizedBox(height: 12.h),

                  // Upload section with dashed border
                  UploadSection(),
                  SizedBox(height: 20.h),
                  Text('Optional contact information', style: SSTextStyle14400),
                  SizedBox(height: 12.h),

                  BorderedMultilineInput(
                    controller: _characterController,
                    hint: 'Describe a Content of the Avatar.....',
                  ),
                  SizedBox(height: 120.h),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: DualActionButtons(
                      leftLabel: 'Cancel',
                      rightLabel: 'Select',
                      leftIsPrimary: false,
                      onLeftTap: () {
                        // Handle cancel
                        print('Cancel tapped');
                        Navigator.pop(context);
                      },
                      onRightTap: () {
                        // Handle select action

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
