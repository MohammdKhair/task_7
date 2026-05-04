import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task_7/core/const/app_colors.dart';
import 'package:task_7/screen/controller/add_controller.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(addController.titleOfAppbar),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: addController.titleController,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: addController.contentController,
            decoration: InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          GetBuilder<AddController>(
            builder: (controller) {
              return SizedBox(
                height: 200,
                child: controller.pickedImage != null
                    ? Image.file(controller.pickedImage!)
                    : Placeholder(),
              );
            },
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              addController.pickImage();
            },
            label: Text("Pick Image"),
            icon: Icon(Icons.image),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              addController.addOrEditNote();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(addController.titleOfAppbar),
          ),
        ],
      ),
    );
  }
}
