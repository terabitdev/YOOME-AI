import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/login_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/components/custom_textfield.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 10.w),
                  Text('Login', style: LTextStyle18500),
                ],
              ),
              SizedBox(height: 34.h),
              Text('EMAIL', style: LTextStyle12400),
              SizedBox(height: 7.h),
              Obx(
                () => CustomTextField(
                  controller: logincontroller.emailCtrl,
                  title: 'Please enter your email',
                  keyboardType: TextInputType.emailAddress,
                  errorText: logincontroller.emailError.value,
                ),
              ),
              SizedBox(height: 34.h),
              Text('PASSWORD', style: LTextStyle12400),
              SizedBox(height: 7.h),
              Obx(
                () => CustomTextField(
                  controller: logincontroller.passwordCtrl,
                  title: 'Please enter your password',
                  keyboardType: TextInputType.visiblePassword,
                  errorText: logincontroller.passwordError.value,
                  obscureText: true,
                ),
              ),
              const Spacer(),
              Obx(
                () => RoundButton(
                  title: logincontroller.isLoading.value
                      ? 'Logging in...'
                      : 'Login',
                  color: ColorConstants.buttonColor,
                  onTap: logincontroller.login,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: LTextStyle14500.copyWith(color: Colors.white70),
                  ),
                  InkWell(
                    onTap: () => Get.offAll(SignupScreen()),
                    child: Text(
                      'Sign Up',
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
    );
  }
}
