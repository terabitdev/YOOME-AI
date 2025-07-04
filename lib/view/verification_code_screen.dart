import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../resources/colors/app_colors.dart';
import '../resources/constants/app_style.dart';
import '../Controllers/verification_code_controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  // page‑local controller (auto‑disposed on pop)
  final vc = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      // tap anywhere to dismiss keyboard
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 54.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ───── Header ─────
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 10.w),
                  Text('Login', style: LTextStyle18500),
                ],
              ),
              SizedBox(height: 34.h),
              Text('Verification Code', style: VTextStyle19700),
              SizedBox(height: 36.h),

              // ───── PIN field ─────
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: vc.codeCtrl,
                animationType: AnimationType.fade,
                onChanged: (_) {}, // no‑op for now
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(28.r),
                  fieldHeight: 80.h,
                  fieldWidth: 80.w,
                  activeFillColor: ColorConstants.textFieldColor,
                  inactiveFillColor: ColorConstants.textFieldColor,
                  selectedFillColor: ColorConstants.textFieldColor,
                  activeColor: ColorConstants.buttonColor,
                  inactiveColor: ColorConstants.textFieldColor,
                  selectedColor: ColorConstants.buttonColor,
                ),
                cursorColor: ColorConstants.buttonColor,
                textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
              ),

              // ───── Validation error (reactive) ─────
              Obx(
                () => vc.codeError.value == null
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          vc.codeError.value!,
                          style: TextStyle(color: Colors.red, fontSize: 12.sp),
                        ),
                      ),
              ),

              const Spacer(),

              // ───── Resend row (reactive) ─────
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, color: Color(0xFFC0C0C0), size: 20),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: vc.resendCode,
                      child: Text(
                        vc.secondsLeft.value == 0
                            ? 'Resend code'
                            : 'Resend code (${vc.secondsLeft})',
                        style: RTextStyle18400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // ───── Verify button (reactive) ─────
              Obx(() {
                final loading = vc.isLoading.value;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.buttonColor,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    onPressed: loading ? null : vc.verifyCode,
                    child: loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text('Verify', style: LTextStyle18500),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
