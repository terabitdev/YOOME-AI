import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';
import 'package:yoome_ai/view/wallet_screen.dart';

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
  String isSelectedPlan = 'month';

  LinearGradient getGradient(String plan) {
    switch (plan) {
      case 'month':
        return const LinearGradient(
          colors: [
            Color(0xFFFFB8E0),
            Color(0xFFBE9EFF),
            Color(0xFF88C0FC),
            Color(0xFF86FF99),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case '3months':
        return const LinearGradient(
          colors: [
            Color(0xFFFFB8E0),
            Color(0xFFBE9EFF),
            Color(0xFF88C0FC),
            Color(0xFF86FF99),
          ],
        );
      case 'year':
        return const LinearGradient(
          colors: [
            Color(0xFFFFB8E0),
            Color(0xFFBE9EFF),
            Color(0xFF88C0FC),
            Color(0xFF86FF99),
          ],
        );
      default:
        return const LinearGradient(colors: [Colors.grey, Colors.grey]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 52.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                ),
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
                    // Tabs
                    Container(
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
                            title: 'Plus',
                            isFirst: true,
                            isSelected: isSelected == 'Plus',
                            onTap: () => setState(() => isSelected = 'Plus'),
                            isMiddle: false,
                          ),
                          SegmentedTabButton(
                            title: 'Ultra',
                            isMiddle: true,
                            isSelected: isSelected == 'Ultra',
                            onTap: () => setState(() => isSelected = 'Ultra'),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Plan Containers
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        children: ['month', '3months', 'year'].map((plan) {
                          final bool selected = isSelectedPlan == plan;
                          final gradient = getGradient(plan);

                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                isSelectedPlan = plan;
                              }),
                              child: Container(
                                height: 102.h,
                                padding: EdgeInsets.symmetric(
                                  vertical: 18.h,
                                  horizontal: 8.w,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 6.w),
                                decoration: BoxDecoration(
                                  gradient: selected ? gradient : null,
                                  color: selected ? null : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: GradientBoxBorder(
                                    gradient: gradient,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (selected)
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      plan == 'month'
                                          ? 'Per Month'
                                          : plan == '3months'
                                          ? 'Per 3 Months'
                                          : 'Per Year',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      plan == 'month'
                                          ? 'USD 8.99'
                                          : plan == '3months'
                                          ? 'USD 35.99'
                                          : 'USD 1295.99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 7.sp,
                                      ),
                                    ),
                                    if (plan != 'month') ...[
                                      SizedBox(height: 2.h),
                                      Text(
                                        plan == '3months'
                                            ? 'USD 12 / Months'
                                            : 'USD 11 / Months',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Text(
                      'Secured with App Store, Cancel Anytime',
                      style: SSTextStyle14400,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 21.h),

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

                    RoundButton(
                      title: 'Subscribe',
                      color: ColorConstants.buttonColor,
                      onTap: () {
                        Get.to(MatthewSupportsScreen());
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
