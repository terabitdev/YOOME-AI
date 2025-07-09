// lib/widgets/custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/nav_bar_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.selectedIndex.value],

        // ───────── Bottom nav ─────────
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black,
          height: 60.h,
          elevation: 0,
          indicatorColor: Colors.transparent,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changeTab,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

          destinations: [
            // ─── Home ───
            NavigationDestination(
              label: '',
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                width: 30.w,
                height: 30.h,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/brighthome.svg', // bright
                width: 30.w,
                height: 30.h,
              ),
            ),

            // ─── Generate ───
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/generate.png',
                width: 30.w,
                height: 30.h,
              ),
              selectedIcon: Image.asset(
                'assets/images/brightgenerate.png',
                width: 30.w,
                height: 30.h,
              ),
            ),

            // ─── Character (always same) ───
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/character.png',
                width: 80.w,
                height: 80.h,
              ),
            ),

            // ─── Chat ───
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/chat.png',
                width: 30.w,
                height: 30.h,
              ),
              selectedIcon: Image.asset(
                'assets/images/brightchat.png',
                width: 30.w,
                height: 30.h,
              ),
            ),

            // ─── Profile ───
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/profile.png',
                width: 30.w,
                height: 30.h,
              ),
              selectedIcon: Image.asset(
                'assets/images/brightprofile.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
