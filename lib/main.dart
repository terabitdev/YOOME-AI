import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yoome_ai/view/login_screnn.dart';
import 'package:yoome_ai/view/onboardingscreen.dart';
import 'package:yoome_ai/view/sigin_screen.dart';
import 'package:yoome_ai/view/verification_code_screen.dart';
import 'package:yoome_ai/viewModel/onboarding_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(373, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'YOOME AI',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: child,
            routes: {
              '/home': (context) =>
                  const Placeholder(), // Replace with actual home screen
            },
          ),
        );
      },
      child: const OnboardingScreen(), // Initial screen
    );
  }
}
