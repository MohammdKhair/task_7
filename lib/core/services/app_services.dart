import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_7/core/config/supabase_config.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Supabase.initialize(
      url: SupabaseConfig.url,
      anonKey: SupabaseConfig.anonKey,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
