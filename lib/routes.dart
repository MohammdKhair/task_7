import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_7/core/const/app_routes.dart';
import 'package:task_7/core/middleware/app_middleware.dart';
import 'package:task_7/screen/view/add_view.dart';
import 'package:task_7/screen/view/auth_view.dart';
import 'package:task_7/screen/view/home_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.auth,
    page: () => const AuthView(),
    middlewares: [MyMiddleWare()],
  ),
  GetPage(name: AppRoute.home, page: () => const HomeView()),
  GetPage(name: AppRoute.add, page: () => const AddView()),

];
