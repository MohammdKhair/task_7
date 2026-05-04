import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_7/core/class/crud_notes.dart';
import 'package:task_7/core/class/storage_notes.dart';

class AddController extends GetxController {
  String titleOfAppbar = "";
  late TextEditingController titleController;
  late TextEditingController contentController;
  String id = "";
  File? pickedImage;

  Future<void> pickImage() async {
    final im = await ImagePicker().pickImage(source: ImageSource.camera);
    if (im != null) {
      pickedImage = File(im.path);
      update();
    }
  }

  Future<void> addOrEditNote() async {
    if (Get.arguments != null) {
      try {
        await CrudNotes().update(
          id,
          titleController.text,
          contentController.text,
        );
        Get.back();
      } on Exception catch (e) {
        Get.snackbar("Error", e.toString());
      }
    } else {
      try {
        await CrudNotes().create(
          titleController.text,
          contentController.text,
          await StorageNotes().uploadImage(pickedImage!),
        );
        Get.back();
      } on Exception catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    if (Get.arguments != null) {
      titleOfAppbar = "Edit Note";
      titleController.text = Get.arguments["title"];
      contentController.text = Get.arguments["content"];
      id = Get.arguments["id"];
      pickedImage = null;
    } else {
      titleOfAppbar = "Add Note";
    }
    super.onInit();
  }
}
