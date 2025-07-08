import 'dart:async';
import 'package:get/get.dart';
import 'package:yoome_ai/view/sigin_screen.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    // Wait 100 seconds then navigate
    Timer(const Duration(minutes: 100), () {
      isLoading.value = false;
      Get.offAll(() => SignInScreen());
    });
  }
}
