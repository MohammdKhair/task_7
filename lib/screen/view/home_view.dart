import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_7/core/const/app_colors.dart';
import 'package:task_7/screen/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            onPressed: () {
              homeController.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.goToAddNote(null);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return StreamBuilder(
            stream: controller.loadNotes(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                controller.notes = asyncSnapshot.data;

                return ListView.separated(
                  padding: const EdgeInsets.all(16.0),

                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: AppColors.primary,
                      title: Text(controller.notes[index]["title"]),
                      subtitle: Text(controller.notes[index]["content"]),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      leading: controller.notes[index]["image_path"] != null
                          ? CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                controller.getImage(
                                  controller.notes[index]["image_path"],
                                ),
                              ),
                            )
                          : null,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              homeController.goToAddNote(
                                controller.notes[index],
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteNote(
                                controller.notes[index]["id"].toString(),
                                controller.notes[index]["image_path"],
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                );
              } else if (asyncSnapshot.hasError) {
                return Center(child: Text("Error"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
