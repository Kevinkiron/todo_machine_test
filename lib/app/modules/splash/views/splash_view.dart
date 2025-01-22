import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/utils/app_images.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/global.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 3000),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.easeInOutCubicEmphasized,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: Image.asset(
                      AppImages.splash,
                      width: Constants.width * .3,
                      height: Constants.height * .3,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
