import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_7/core/const/app_colors.dart';
import 'package:task_7/core/services/app_services.dart';
import 'package:task_7/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

// 1Ht1c7HJwrQHHWhq

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.dark(primary: AppColors.primary),
      ),
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
