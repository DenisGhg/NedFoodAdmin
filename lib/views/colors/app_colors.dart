import 'package:flutter/material.dart';
import 'package:ned_food_admin/providers/themes_provider/theme_provider.dart';
import 'package:provider/provider.dart';


class AppColors {
  static Color blueColor = const Color.fromARGB(255, 33, 150, 243);
  static Color redColor = const Color.fromARGB(255, 244, 67, 54);
  static Color greenColor = const Color.fromARGB(255, 76, 175, 80);
  static Color greyColor = const Color.fromARGB(255, 158, 158, 158);
  static Color whiteColor = const Color.fromARGB(255, 255, 255, 255);
  static Color orangeColor = const Color.fromARGB(255, 255, 152, 0);
  static Color blueColorSecond = const Color.fromARGB(255, 13, 71, 161);
  static Color blackColor = const Color.fromARGB(255, 0, 0, 0);
  static Color transparentColor = const Color.fromARGB(0, 0, 0, 0);

  // La couleur primaire basée sur le mode sombre/claire
  static Color primaryColor(BuildContext context) {
    bool isDarkMode = context.read<ThemeProvider>().isDarkMode;
    return isDarkMode ? whiteColor : blackColor;
  }

  // La couleur primaire basée sur le mode sombre/claire
  static Color themeColor(BuildContext context) {
    bool isDarkMode = context.read<ThemeProvider>().isDarkMode;
    return isDarkMode ? blackColor : whiteColor;
  }

  static Color getNotificationColor(bool isRead, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isDark) {
      return isRead
          ? Color.fromARGB(255, 49, 54, 67)
          : Color.fromARGB(255, 25, 42, 86);
    } else {
      return isRead
          ? Color.fromARGB(255, 240, 248, 255)
          : Color.fromARGB(255, 182, 220, 246);
    }
  }
}

