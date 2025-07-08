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

class ContentPreferences extends StatefulWidget {
  const ContentPreferences({Key? key}) : super(key: key);

  @override
  State<ContentPreferences> createState() => _ContentPreferencesState();
}

class _ContentPreferencesState extends State<ContentPreferences> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.put(WelcomeController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 52.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Text('Content Preferences', style: SSTextStyle18500),
                    ],
                  ),
                  SizedBox(height: 23.h),

                  Text('Welcome YOOME AI!', style: WTextStyle19700),
                  SizedBox(height: 61.h),

                  Text('YOUR NAME', style: LTextStyle12400),
                  SizedBox(height: 7.h),

                  CustomTextField(
                    title: 'Please enter your name',
                    controller: emailController,
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

                  const Spacer(),

                  RoundButton(
                    title: 'Next',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YourPreferenceScreen(),
                        ),
                      );
                    },
                    color: ColorConstants.buttonColor,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
