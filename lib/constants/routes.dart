import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/pages/a_homepage.dart';
import 'package:ned_food_admin/views/pages/a_main_page.dart';
import 'package:ned_food_admin/views/pages/menus_pages/menu_main_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/order_history_page.dart';
import 'package:ned_food_admin/views/pages/stat_pages/stat_page.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/a_homepage': (context) => const AHomepage(),
  '/a_mainPage' : (context) => const AMainPage(),
  '/menu_main_page' : (context) => const MenuMainPage(),
  '/order_history_page' : (context) => const OrderHistoryPage(),
  '/stat_page' : (context) => const StatPage(),

  //TALENT PAGES
};

class AppRoutes{
  static const String AHOMEPAGE = '/a_homepage';
  static const String AMAINPAGE = '/a_mainPage';
  static const String MENUMAINPAGE = '/menu_main_page';
  static const String ADDOREDITMENUPAGE = '/add_or_edit_menu_page';
  static const String ORDERHISTORYPAGE = '/order_history_page';
  static const String STATPAGE = '/stat_page';

}