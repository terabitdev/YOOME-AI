import 'dart:async';
import 'package:get/get.dart';
import 'package:yoome_ai/view/sigin_screen.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    // Wait 5 seconds then navigate
    Timer(const Duration(seconds: 5), () {
      isLoading.value = false;
      Get.offAll(() => SignInScreen());
    });
  }
}
