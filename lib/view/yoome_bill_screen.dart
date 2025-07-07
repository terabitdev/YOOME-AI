import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';

class YoomeBillScreen extends StatefulWidget {
  const YoomeBillScreen({super.key});

  @override
  State<YoomeBillScreen> createState() => _YoomeBillScreenState();
}

class _YoomeBillScreenState extends State<YoomeBillScreen> {
  String selectedTab = 'Current'; // Track selected tab

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
                    'YOOME Bill',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 52.h),

            // Main Content Container - No side padding
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: ColorConstants.lightGrey.withOpacity(.25),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Tab Buttons - Connected without spaces
                    Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            SegmentedTabButton(
                              title: 'All',
                              isFirst: true,
                              isSelected: selectedTab == 'All',
                              onTap: () {},
                              isMiddle: false,
                            ),
                            SegmentedTabButton(
                              title: 'Spend',
                              isMiddle: true,
                              isSelected: selectedTab == 'Current',
                              onTap: () {
                                setState(() {
                                  selectedTab = 'Current';
                                });
                              },
                            ),
                            SegmentedTabButton(
                              title: 'Purcahse',
                              isLast: true,
                              isSelected: selectedTab == 'History',
                              onTap: () {
                                setState(() {
                                  selectedTab = 'History';
                                });
                              },
                              isMiddle: false,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Empty State Content
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/nocharacter.png',
                              width: 150.w,
                              height: 150.h,
                            ),
                            SizedBox(height: 24.h),

                            // No More Data Text
                            Text(
                              'No More Data',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(
    String title, {
    bool isFirst = false,
    bool isMiddle = false,
    bool isLast = false,
  }) {
    final isSelected = selectedTab == title;

    BorderRadius borderRadius;
    if (isSelected) {
      // Selected button has full border radius
      borderRadius = BorderRadius.circular(25);
    } else {
      // Unselected buttons follow container shape
      if (isFirst) {
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        );
      } else if (isLast) {
        borderRadius = const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        );
      } else {
        borderRadius = BorderRadius.zero; // No radius for middle button
      }
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFA259FF) : Colors.transparent,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
