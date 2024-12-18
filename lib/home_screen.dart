import 'package:flutter/material.dart';
import 'package:flutter_theming/theme/theme_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Theme with GetX'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => SwitchListTile(
              title: Text('Dark Mode'),
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            )),
            SizedBox(height: 16),
            Container(
              height: 150,
              width: double.infinity,
              color: theme.colorScheme.primaryContainer,
              child: Center(
                child: Text("Ais Jac",style: theme.textTheme.titleLarge),
              ),
            )
          ],
        ),
      ),
    );
  }
}
