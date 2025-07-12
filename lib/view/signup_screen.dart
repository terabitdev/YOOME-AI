import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/signup_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/custom_textfield.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/login_screnn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signupcontroller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 10.w),
                    Text('Signup', style: LTextStyle18500),
                  ],
                ),
                SizedBox(height: 34.h),

                // Email
                Text('EMAIL', style: LTextStyle12400),
                SizedBox(height: 7.h),
                Obx(
                  () => CustomTextField(
                    controller: signupcontroller.emailCtrl,
                    title: 'Please enter your email',
                    keyboardType: TextInputType.emailAddress,
                    errorText: signupcontroller.emailError.value,
                  ),
                ),
                SizedBox(height: 24.h),

                // Password
                Text('PASSWORD', style: LTextStyle12400),
                SizedBox(height: 7.h),
                Obx(
                  () => CustomTextField(
                    controller: signupcontroller.passwordCtrl,
                    title: 'Please enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    errorText: signupcontroller.passwordError.value,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 24.h),
                // Confirm Password
                Text('CONFIRM PASSWORD', style: LTextStyle12400),
                SizedBox(height: 7.h),
                Obx(
                  () => CustomTextField(
                    controller: signupcontroller.confirmPasswordCtrl,
                    title: 'Please confirm your password',
                    keyboardType: TextInputType.visiblePassword,
                    errorText: signupcontroller.confirmPasswordError.value,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 280.h),
                Obx(
                  () => RoundButton(
                    title: signupcontroller.isLoading.value
                        ? 'Signing Up...'
                        : 'Sign Up',
                    color: ColorConstants.buttonColor,
                    onTap: signupcontroller.signUp,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: LTextStyle14500.copyWith(color: Colors.white70),
                    ),
                    InkWell(
                      onTap: () => Get.offAll(LoginScreen()),
                      child: Text(
                        'Login',
                        style: LTextStyle14500.copyWith(
                          color: ColorConstants.buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
