import 'package:flutter/material.dart';
import 'package:flutter_theming/theme/app_theme.dart';
import 'package:flutter_theming/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'home_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Theme with GetX',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Get.find<ThemeController>().getSavedTheme(),
      home: const HomeScreen(),
    );
  }
}
