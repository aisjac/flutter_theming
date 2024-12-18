import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage(); // GetStorage instance
  var isDarkMode = false.obs;

  // Get saved theme from storage (default to system theme if not saved)
  ThemeMode getSavedTheme() {
    bool? savedTheme = _storage.read('isDarkMode');
    if (savedTheme != null) {
      isDarkMode.value = savedTheme;
      return savedTheme ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.system; // Default to system theme
    }
  }

  // Toggle theme mode and save the preference
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _storage.write('isDarkMode', isDarkMode.value); // Save the selected theme
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize the theme mode based on the saved preference
    getSavedTheme();
  }
}
