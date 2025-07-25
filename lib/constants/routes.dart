import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/pages/a_homepage.dart';
import 'package:ned_food_admin/views/pages/a_main_page.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/a_homepage': (context) => const AHomepage(),
  '/a_mainPage' : (context) => const AMainPage()

  //TALENT PAGES
};

class AppRoutes{
  static const String AHOMEPAGE = '/a_homepage';
  static const String AMAINPAGE = '/a_mainPage';
}