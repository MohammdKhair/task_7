import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task_7/core/const/app_colors.dart';
import 'package:task_7/screen/controller/auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return ListView(
              children: [
                Center(
                  child: Text(
                    authController.isLogin ? "Login" : "SignUp",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  //obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    authController.login();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(authController.isLogin ? "Login" : "SignUp"),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    authController.switchPage();
                  },
                  child: Text(
                    authController.isLogin ? "Create account" : "SignIn",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
