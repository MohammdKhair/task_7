import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_7/core/class/auth_notes.dart';
import 'package:task_7/core/const/app_routes.dart';
import 'package:task_7/core/services/app_services.dart';

class AuthController extends GetxController {
  MyServices myServices = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool isLogin;

  void login() async {
    try {
      isLogin
          ? await AuthNotes().signIn(
              emailController.text,
              passwordController.text,
            )
          : await AuthNotes().signUp(
              emailController.text,
              passwordController.text,
            );
      Get.offAllNamed(AppRoute.home);
      myServices.sharedPreferences.setString("path", "home");
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void switchPage() {
    isLogin = !isLogin;
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isLogin = true;
    super.onInit();
  }
}
