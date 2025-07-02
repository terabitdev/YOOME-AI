import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yoome_ai/Controllers/splash_controller.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA06AF9), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              RichText(
                text: TextSpan(
                  text: 'YOOME ',
                  style: TextStyle(
                    fontSize: 52.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: const [
                    TextSpan(
                      text: 'AI',
                      style: TextStyle(color: Color(0xFFA259FF)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Unlimited Chat with AI',
                style: TextStyle(fontSize: 19.sp, color: Color(0xFF808080)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
