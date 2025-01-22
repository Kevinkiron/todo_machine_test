import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigate();
    super.onInit();
  }

  Future<void> navigate() async {
    final prefs = await SharedPreferences.getInstance();
    final onBoard = prefs.getBool("onBoard");

    await Future.delayed(const Duration(seconds: 3));
    if (onBoard == null || onBoard == true) {
      Get.offAllNamed(Routes.ONBOARD);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
