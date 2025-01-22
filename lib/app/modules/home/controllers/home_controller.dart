import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/api_services.dart/api_endpoints.dart';
import 'package:todo/app/data/api_services.dart/base_service.dart';
import 'package:todo/app/modules/home/views/edit_details_page.dart';
import 'package:todo/app/modules/home/views/home_view.dart';
import 'package:todo/utils/global.dart';

class HomeController extends GetxController {
  final apiService = ApiService();
  final RxList todoList = [].obs;
  final RxList<bool> checkedList = <bool>[].obs;

  RxBool homeLoad = false.obs;
  Future<void> getTodoList() async {
    homeLoad.value = true;
    try {
      final response = await apiService.get(ApiEndpoints.getTodos);
      if (response.statusCode == 200 || response.statusCode == 201) {
        todoList.value = response.data;
        checkedList.value = List.generate(todoList.length, (index) => false);
        log(response.data);
        homeLoad.value = false;
      } else {
        // log(response.data);
        homeLoad.value = false;
      }
    } catch (e) {
      log(e.toString());
      homeLoad.value = false;
    }
  }

  final TextEditingController edittitleController = TextEditingController();

  RxMap todoDeatil = {}.obs;
  Future<void> getTodoDetail({required String id}) async {
    try {
      final response = await apiService.get(ApiEndpoints.todoDetail + id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        todoDeatil.value = response.data;
        Get.back();

        Get.to(() => DetailsPage());

        log(response.data);
      } else {
        // log(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  Future<void> addTodo({required String title}) async {
    try {
      final response =
          await apiService.post(ApiEndpoints.getTodos, data: {'title': title});
      if (response.statusCode == 200 || response.statusCode == 201) {
        todoDeatil.value = response.data;
        titleController.clear();
        descController.clear();
        toastmsgTop("Todo Added Successfully");
        Get.off(() => HomeView());
        log(response.data);
      } else {
        // log(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> editTodo({
    required String title,
    required String id,
  }) async {
    try {
      final response = await apiService
          .put(ApiEndpoints.todoDetail + id, data: {'title': title});
      if (response.statusCode == 200 || response.statusCode == 201) {
        todoDeatil.value = response.data;
        edittitleController.clear();
        toastmsgTop("Todo Updated Successfully");
        Get.off(() => HomeView());
        log(response.data);
      } else {
        // log(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void toggleChecked(int index, bool value) {
    checkedList[index] = value;
  }

  @override
  void onInit() async {
    await getTodoList();
    super.onInit();
  }
}
