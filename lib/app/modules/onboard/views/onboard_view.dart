import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/app/modules/home/bindings/home_binding.dart';
import 'package:todo/app/modules/home/views/home_view.dart';
import 'package:todo/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:todo/app/routes/app_pages.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/global.dart';
import '../../../../utils/kstyles.dart';
import 'package:animate_do/animate_do.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: controller.onboardItems.length,
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  OnboardCommon(
                    desc: controller.onboardItems[index].desc,
                    img: controller.onboardItems[index].img,
                    title: controller.onboardItems[index].title,
                  ),
                  if (index != controller.onboardItems.length - 1)
                    Positioned(
                      top: 60,
                      right: 20,
                      child: GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('onBoard', false);
                          Get.offAllNamed(Routes.HOME);
                        },
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Kstyles().med(
                              text: "Skip",
                              size: 12,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Obx(() {
              return GestureDetector(
                onTap: controller.nextPage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        strokeWidth: 4,
                        backgroundColor:
                            AppColors.backgroundColor.withValues(alpha: 0.6),
                        color: AppColors.primary,
                        value: controller.currentProgress.value,
                      ),
                    ),
                    Container(
                      width: Constants.width * .14,
                      height: Constants.height * .1,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: AppColors.backgroundColor,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class OnboardCommon extends StatelessWidget {
  const OnboardCommon({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
  });
  final String img;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: AppColors.black,
          height: Constants.height,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              img,
              height: Constants.height * .85,
              width: Constants.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: Constants.width,
          height: Constants.height * 0.41,
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SlideInUp(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Constants.height * 0.04,
                  ),
                  Image.asset(
                    AppImages.splash,
                    width: Constants.width * 0.45,
                    height: Constants.height * 0.035,
                  ),
                  SizedBox(
                    height: Constants.height * .025,
                  ),
                  Kstyles().bold(text: title, size: 22),
                  SizedBox(
                    height: Constants.height * .025,
                  ),
                  SizedBox(
                    child: Kstyles().med(
                      text: desc,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    height: Constants.height * .025,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
