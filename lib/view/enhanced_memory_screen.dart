import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/subscribe_screen.dart';

class EnhancedMemoryScreen extends StatefulWidget {
  EnhancedMemoryScreen({super.key});

  @override
  State<EnhancedMemoryScreen> createState() => _EnhancedMemoryScreenState();
}

class _EnhancedMemoryScreenState extends State<EnhancedMemoryScreen> {
  final TextEditingController memoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 14.w),
                  Text('Enhanced Memory', style: LTextStyle18500),
                ],
              ),
              SizedBox(height: 41.h),
              Text(
                "Memory input",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E2E),
                  border: Border.all(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextField(
                  controller: memoryController,
                  maxLength: 300,
                  maxLines: null,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText:
                        "Enter a memory to save; conflicts with the bot’s personality may cause issues.",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    counterStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              InkWell(
                onTap: () {
                  Get.to(SubscribeScreen());
                },
                child: Image.asset('assets/images/inform progress board.png'),
              ),
              const Spacer(),
              RoundButton(
                title: 'Confirm',
                color: ColorConstants.buttonColor,
                onTap: () {
                  // Handle the send code action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10.sp, color: Colors.black),
      ),
    );
  }
}
