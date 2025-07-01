import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/components/google_roundbutton.dart';
import 'package:yoome_ai/resources/components/reuseable_social_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/grid_image.png', // Your full character collage
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
                      title: "Sign in with Google",
                      onTap: () {},
                      color: const Color(0xFF1A1A1A),
                      loading: false,
                    ),

                    const SizedBox(height: 24),

                    // Divider and "or"
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

                    const SizedBox(height: 20),

                    // Social Buttons (X, Discord, Mail)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialButton(icon: Icons.close, onTap: () {}),
                        SocialButton(
                          icon: Icons.discord,
                          onTap: () {},
                          iconColor: Colors.indigoAccent,
                        ),
                        SocialButton(
                          icon: Icons.email_outlined,
                          onTap: () {},
                          iconColor: Colors.purpleAccent,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Terms & Privacy
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
