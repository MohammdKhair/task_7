import 'package:get/get.dart';
import 'package:task_7/core/class/auth_notes.dart';
import 'package:task_7/core/class/crud_notes.dart';
import 'package:task_7/core/class/storage_notes.dart';
import 'package:task_7/core/const/app_routes.dart';
import 'package:task_7/core/services/app_services.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  List<Map<String, dynamic>> notes = [];

  Stream loadNotes() {
    return CrudNotes().realTimeRead();
  }

  Future<void> deleteNote(String id , String imagePath) async {
    try {
      await CrudNotes().delete(id);
      await StorageNotes().deleteImage(imagePath);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  String getImage(String path) {
    return StorageNotes().getImage(path);
  }

  Future<void> logout() async {
    try {
      await AuthNotes().signOut();
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
    myServices.sharedPreferences.setString("path", "auth");
    Get.offAllNamed(AppRoute.auth);
  }

  void goToAddNote(Map<String, dynamic>? note) {
    Get.toNamed(AppRoute.add, arguments: note);
  }

  @override
  void onInit() {
    loadNotes();
    super.onInit();
  }
}
