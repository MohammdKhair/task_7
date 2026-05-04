import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_7/core/const/app_routes.dart';
import 'package:task_7/core/services/app_services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("path") == "home") {
      return const RouteSettings(name: AppRoute.home);
    }
    return null;
  }
}
