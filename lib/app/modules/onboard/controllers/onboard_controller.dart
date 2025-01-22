import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/app/routes/app_pages.dart';
import 'package:todo/utils/app_images.dart';

import '../../../data/models.dart/dummy.dart';

class OnboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final PageController pageController = PageController();
  late AnimationController animationController;
  late Animation<double> animation;
  final RxDouble currentProgress = 0.0.obs;

  final List<OnboardModel> onboardItems = [
    OnboardModel(
      img: AppImages.onboard2,
      title: "Manage your tasks",
      desc: "You can easily manage all of your daily tasks in todo for free",
    ),
    OnboardModel(
      img: AppImages.onboard1,
      title: "Create daily routine",
      desc:
          "In Todo you can create your personalized routine to stay productive",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1 / onboardItems.length)
        .animate(animationController)
      ..addListener(() {
        currentProgress.value = animation.value;
      });
    animationController.forward();
  }

  void onPageChanged(int page) {
    animationController.reset();
    animation = Tween<double>(
      begin: page / onboardItems.length,
      end: (page + 1) / onboardItems.length,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    animationController.forward();
  }

  void nextPage() async {
    if (pageController.page! < onboardItems.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('onBoard', false);
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    animationController.dispose();
    super.onClose();
  }
}
