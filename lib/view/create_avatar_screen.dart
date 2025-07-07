import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class CreateAvatarScreen extends StatefulWidget {
  const CreateAvatarScreen({super.key});

  @override
  State<CreateAvatarScreen> createState() => _CreateAvatarScreenState();
}

class _CreateAvatarScreenState extends State<CreateAvatarScreen> {
  int selectedIndex = 0; // Track selected avatar option

  // Avatar data with percentages
  final List<String> avatarPercentages = ['27%', '30%', '27%', '30%'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Create avatar',
                    style:
                        LTextStyle18500 ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              Expanded(
                child: Column(
                  children: [
                    // 2x2 Grid of Avatar Options
                    SizedBox(
                      height: 400.h, // Fixed height for the grid
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.85, // Adjusted aspect ratio
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildAvatarOption(index);
                        },
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Bottom message and upload section
                    Column(
                      children: [
                        Text(
                          'The image doesn\'t look as expected',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Upload character image button
                        InkWell(
                          onTap: () {
                            // Handle upload image
                            print('Upload character image tapped');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.upload,
                                color: Colors.purple,
                                size: 20.sp,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                'Upload character image',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Spacer(), // Push bottom buttons to the bottom
                  ],
                ),
              ),

              // Bottom buttons
              DualActionButtons(
                leftLabel: 'Re-Generate',
                rightLabel: 'Select',
                leftIsPrimary: false,
                onLeftTap: () {
                  // Handle re-generate
                  print('Re-Generate tapped');
                },
                onRightTap: () {
                  // Handle select action
                  print('Selected avatar option: $selectedIndex');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarOption(int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 205.h,
        width: 156.w, // Fixed width for each avatar option
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? Color(0xFFA06AF9)
                : Color(0xFFA06AF9).withOpacity(0.3),
            width: isSelected ? 2.w : 1.w,
          ),
          color: Color.fromARGB(255, 123, 80, 192),
        ),
        child: Center(
          child: Text(
            avatarPercentages[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
