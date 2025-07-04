import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/gradient_background.dart';
import '../controllers/splash_controller.dart';
import '../resources/constants/app_style.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        // ← just wrap
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              RichText(
                text: TextSpan(
                  text: 'YOOME ',
                  style: STextStyle52900,
                  children: [
                    TextSpan(
                      text: 'AI',
                      style: STextStyle52900.copyWith(color: Color(0xFFB56AFF)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text('Unlimited Chat with AI', style: STextStyle19400),
            ],
          ),
        ),
      ),
    );
  }
}
