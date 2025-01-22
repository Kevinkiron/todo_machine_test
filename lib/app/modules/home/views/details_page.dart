import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/utils/global.dart';
import 'package:todo/utils/kstyles.dart';

import '../../../../utils/app_images.dart';

class DetailsPage extends GetView<HomeController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackGrey,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.black,
        title: Kstyles().bold(text: "Todo Detail", size: 18),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              controller.todoDeatil["completed"] == true
                  ? AppImages.tick
                  : AppImages.notComplete,
              height: 40,
              width: 40,
            ),
            5.height,
            Kstyles().reg(
                text: controller.todoDeatil["completed"] == true
                    ? "Complete"
                    : "Not Complete",
                size: 15),
            10.height,
            Kstyles().bold(
                text: controller.todoDeatil["title"],
                size: 16,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible),
          ],
        ),
      ),
    );
  }
}
