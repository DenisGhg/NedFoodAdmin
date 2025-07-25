import 'package:flutter/material.dart';
import 'package:ned_food_admin/providers.dart';
import 'package:ned_food_admin/providers/themes_provider/theme_provider.dart';
import 'package:ned_food_admin/views/pages/menus_pages/add_or_edit_menu_page.dart';
import 'package:ned_food_admin/views/themes/app_themes.dart';
import 'package:provider/provider.dart';

import 'constants/routes.dart';
import 'models/menu_model.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NedFoodAdmin",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routes: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.AMAINPAGE,
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.ADDOREDITMENUPAGE) {
          final menu = settings.arguments as MenuModel?;
          return MaterialPageRoute(
            builder: (_) => AddOrEditMenuPage(existingMenu: menu),
          );
        }
        return null;
      },
    );
  }
}
