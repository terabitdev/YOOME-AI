import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 36.h),
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: codeController,
                animationType: AnimationType.fade,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.r),
                  fieldHeight: 50.h,
                  fieldWidth: 40.w,
                  activeFillColor: ColorConstants.textFieldColor,
                  inactiveFillColor: ColorConstants.textFieldColor,
                  selectedFillColor: ColorConstants.textFieldColor,
                  activeColor: ColorConstants.buttonColor,
                  inactiveColor: ColorConstants.textFieldColor,
                  selectedColor: ColorConstants.buttonColor,
                ),
                cursorColor: ColorConstants.buttonColor,
                textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Color(0xFFC0C0C0), size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Resend code (57)',
                    style: TextStyle(
                      color: Color(0xFFC0C0C0),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
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
