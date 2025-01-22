import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/utils/custom_textfield.dart';
import 'package:todo/utils/global.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/appbutton.dart';
import '../../../../utils/kstyles.dart';

class AddNewTodo extends GetView<HomeController> {
  const AddNewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        title: Kstyles().bold(text: "Add New Todo", size: 18),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
        ),
        padding: EdgeInsets.all(20),
        child: AppButton(
          text: "Add Todo",
          onTap: () {
            if (formKey.currentState!.validate()) {
              controller.addTodo(title: controller.titleController.text.trim());
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Kstyles().bold(text: "Title", size: 18),
              10.height,
              CustomTextfield(
                hintText: "Add title",
                controller: controller.titleController,
                validator: (value) {
                  return value!.isEmpty ? "Title is required" : null;
                },
              ),
              20.height,
              Kstyles().bold(text: "Description", size: 18),
              10.height,
              CustomTextfield(
                hintText: "Add Description",
                controller: controller.descController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
