import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/components/google_roundbutton.dart';
import 'package:yoome_ai/resources/components/reuseable_social_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_images.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/login_screnn.dart';
import 'package:get/get.dart';

import '../Controllers/social_auth controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SocialAuthController socialAuthController = Get.put(
    SocialAuthController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(AppImages.gridImage, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => GoogleRoundButton(
                        title: socialAuthController.isGoogleLoading.value
                            ? 'Signing in...'
                            : 'Continue with Google',
                        onTap: socialAuthController.signInWithGoogle,
                        color: const Color(0xFF1A1A1A),
                        loading: socialAuthController.isGoogleLoading.value,
                      ),
                    ),

                    SizedBox(height: 28.h),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white30)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Or continue with",
                            style: DTextStyle13400,
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white30)),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialButton(
                          imagePath: AppImages.twitterLogo,
                          onTap: () {},
                          bgColor: Color(0x80000000),
                        ),
                        SocialButton(
                          imagePath: AppImages.discordLogo,
                          onTap: () {},
                          bgColor: Color(0x80000000),
                        ),
                        SocialButton(
                          imagePath: AppImages.appleLogo,
                          onTap: () {
                            Get.to(() => LoginScreen());
                          },
                          bgColor: Color(0x80000000),
                        ),
                      ],
                    ),
                    SizedBox(height: 67.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: PTextStyle13400White,
                        text: 'By signing in, you agree to our\n',
                        children: [
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(color: Color(0xFFA259FF)),
                          ),
                          TextSpan(text: ' and ', style: PTextStyle13400White),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Color(0xFFA259FF)),
                          ),
                        ],
                      ),
                    ),
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
