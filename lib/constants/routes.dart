import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/pages/a_homepage.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/a_homepage': (context) => const AHomepage(),

  //TALENT PAGES
};

class AppRoutes{
  static const String AHOMEPAGE = '/a_homepage';


}