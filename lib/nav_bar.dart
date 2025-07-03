// lib/widgets/custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/nav_bar_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  // Inject controller once; it stays alive while the bar is in the widget tree.
  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black,
          height: 60.h,
          elevation: 0,
          indicatorColor: Colors.transparent,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changeTab,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/home.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/generate.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/character.png',
                width: 80.w,
                height: 80.h,
              ),
            ),
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/dochat.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
            NavigationDestination(
              label: '',
              icon: Image.asset(
                'assets/images/profile.png',
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
