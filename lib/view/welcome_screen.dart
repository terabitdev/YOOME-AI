import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/welcome_screen_controller.dart';
import 'package:yoome_ai/resources/components/age_selection.dart';
import 'package:yoome_ai/resources/components/custom_textfield.dart';
import 'package:yoome_ai/resources/components/gender_selection.dart';
import 'package:yoome_ai/resources/components/progress_bar.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/your_preference_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressBarWidget(currentStep: 1, totalSteps: 3),
              SizedBox(height: 23.h),

              Text('Welcome YOOME AI!', style: WTextStyle19700),
              SizedBox(height: 61.h),

              Text('YOUR EMAIL', style: LTextStyle12400),
              SizedBox(height: 7.h),

              CustomTextField(
                title: 'Please enter your email',
                controller: controller.emailCtrl,
              ),
              SizedBox(height: 35.h),

              Obx(
                () => GenderSelectionWidget(
                  genderOptions: controller.genderOptions,
                  selectedGender: controller.selectedGender.value,
                  onGenderSelected: controller.selectGender,
                ),
              ),
              SizedBox(height: 35.h),

              Obx(
                () => AgeSelectionWidget(
                  ageOptions: controller.ageOptions,
                  selectedAge: controller.selectedAge.value,
                  onAgeSelected: controller.selectAge,
                ),
              ),

              SizedBox(height: 50.h),

              RoundButton(
                title: 'Next',
                onTap: controller.onNextFromWelcome,
                color: ColorConstants.buttonColor,
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
