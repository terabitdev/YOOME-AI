import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/components/google_roundbutton.dart';
import 'package:yoome_ai/resources/components/reuseable_social_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_images.dart';
import 'package:yoome_ai/view/login_screen.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppImages.gridImage,
              fit: BoxFit.cover,
            ),
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
                    GoogleRoundButton(
                      title: " Continue with Google",
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      color: const Color(0xFF1A1A1A),
                      loading: false,
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.white30)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.white30)),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialButton(imagePath: AppImages.twitterLogo, onTap: () {},
                          bgColor: Color(0x80000000),
                        ),
                        SocialButton(
                          imagePath: AppImages.discordLogo,
                          onTap: () {},
                          bgColor: Color(0x80000000),
                        ),
                        SocialButton(
                          imagePath: AppImages.appleLogo,
                          onTap: () {},
                          bgColor: Color(0x80000000),
                        ),
                      ],
                    ),
                    SizedBox(height: 67.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 12, color: Colors.white60),
                        text: 'By signing in, you agree to our\n',
                        children: [
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(color: Color(0xFFA259FF)),
                          ),
                          TextSpan(text: ' and '),
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
