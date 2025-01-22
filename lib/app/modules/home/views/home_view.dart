import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo/app/modules/home/views/add_new_todo.dart';
import 'package:todo/utils/app_colors.dart';
import 'package:todo/utils/app_images.dart';
import 'package:todo/utils/appbutton.dart';
import 'package:todo/utils/global.dart';
import 'package:todo/utils/kstyles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          leading: SizedBox(),
          surfaceTintColor: AppColors.black,
          backgroundColor: AppColors.black,
          title: Kstyles().bold(text: "Todo List", size: 18),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddNewTodo());
          },
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.add,
            color: AppColors.backgroundColor,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Obx(() {
            return controller.homeLoad.value
                ? Column(
                    children: List.generate(10, (index) {
                    return Container(
                      width: Constants.width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blackGrey),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: AppColors.grey.withValues(alpha: .3),
                            highlightColor:
                                AppColors.grey.withValues(alpha: .1),
                            child: Container(
                              height: 10,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          10.height,
                          Shimmer.fromColors(
                            baseColor: AppColors.grey.withValues(alpha: .3),
                            highlightColor:
                                AppColors.grey.withValues(alpha: .1),
                            child: Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
                : Column(
                    children:
                        List.generate(controller.todoList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return _detailDialogBox(index);
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: AppColors.blackGrey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Kstyles().bold(
                                        text: controller.todoList[index]
                                                ["title"] ??
                                            "",
                                        size: 16,
                                        color: AppColors.backgroundColor,
                                      ),
                                      10.height,
                                      Kstyles().light(
                                        text: "Description",
                                        size: 14,
                                        color: AppColors.backgroundColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() => Checkbox(
                                      side: BorderSide(
                                        color: AppColors.backgroundColor,
                                      ),
                                      checkColor: Colors.white,
                                      value: controller.checkedList[index],
                                      onChanged: (bool? value) {
                                        controller.toggleChecked(
                                            index, value ?? false);
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
          }),
        ));
  }

  Dialog _detailDialogBox(int index) {
    return Dialog(
      backgroundColor: AppColors.blackGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              controller.checkedList[index] == true
                  ? AppImages.tick
                  : AppImages.notComplete,
              height: 40,
              width: 40,
            ),
            5.height,
            Kstyles().reg(
                text: controller.checkedList[index] == true
                    ? "Complete"
                    : "Not Complete",
                size: 15),
            10.height,
            Kstyles().bold(
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                text: controller.todoList[index]["title"] ?? "",
                size: 17),
            5.height,
            Kstyles().reg(text: "Description", size: 15),
            10.height,
            AppButton(
              onTap: () {
                controller.getTodoDetail(
                    id: controller.todoList[index]["id"].toString());
              },
              text: "See Details",
            )
          ],
        ),
      ),
    );
  }
}
