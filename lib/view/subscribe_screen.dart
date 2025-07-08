import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  bool enableNotifications = true;
  bool newMessageVibration = true;
  bool autoPlayVoice = false;
  var isSelected = 'Plus';
  String isSelectedPlan = 'month'; // 'month', '3months', 'year'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // App Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 52.h),
            child: Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                SizedBox(width: 16.w),
                Text('Subscribe', style: SSTextStyle18500),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Tab selection
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.blue.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          SegmentedTabButton(
                            title: 'Plus',
                            isFirst: true,
                            isSelected: isSelected == 'Plus',
                            onTap: () {
                              setState(() {
                                isSelected = 'Plus';
                              });
                            },
                            isMiddle: false,
                          ),
                          SegmentedTabButton(
                            title: 'Ultra',
                            isMiddle: true,
                            isSelected: isSelected == 'Ultra',
                            onTap: () {
                              setState(() {
                                isSelected = 'Ultra';
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Pricing Row
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Row(
                        children: [
                          // Per Month
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedPlan = 'month';
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 102.h,
                                padding: EdgeInsets.symmetric(
                                  vertical: 18.h,
                                  horizontal: 8.w,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                decoration: BoxDecoration(
                                  gradient: isSelectedPlan == 'month'
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xFFB16CEA),
                                            Color(0xFFFF5E69),
                                            Color(0xFFFF8A56),
                                            Color(0xFFFFC56F),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                      : null,
                                  color: isSelectedPlan == 'month'
                                      ? null
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelectedPlan == 'month'
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        if (isSelectedPlan == 'month')
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                      ],
                                    ),
                                    Text(
                                      'Per Months',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'USD 8.99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Per 3 Months
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedPlan = '3months';
                                });
                              },
                              child: Container(
                                width: 103.7.w,
                                height: 102.h,
                                padding: EdgeInsets.symmetric(
                                  vertical: 18.h,
                                  horizontal: 8.w,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                decoration: BoxDecoration(
                                  color: isSelectedPlan == '3months'
                                      ? Color.fromARGB(255, 55, 53, 107)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelectedPlan == '3months'
                                        ? Colors.blue
                                        : Colors.blue.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Per 3 Months',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'USD 35.99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'USD 12 / Months',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Per Year
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedPlan = 'year';
                                });
                              },
                              child: Container(
                                width: 103.7.w,
                                height: 102.h,
                                padding: EdgeInsets.symmetric(
                                  vertical: 18.h,
                                  horizontal: 8.w,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                decoration: BoxDecoration(
                                  color: isSelectedPlan == 'year'
                                      ? Color(0xFF23223C)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelectedPlan == 'year'
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Per Year',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'USD 1295.99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      'USD 11 / Months',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 7.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // Info text
                    Text(
                      'Secured with App Store, Cancel Anytime',
                      style: SSTextStyle18500.copyWith(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 21.h),

                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        'assets/images/subscribe.png',
                        width: 327.w,
                        height: 419.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Send Code Button
                    RoundButton(
                      title: 'Subscribe ',
                      color: ColorConstants.buttonColor,
                      onTap: () {
                        // Handle subscribe action
                        print('Subscribe tapped');
                      },
                    ),

                    SizedBox(height: 25.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
