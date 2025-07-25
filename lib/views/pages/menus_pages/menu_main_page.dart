import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:provider/provider.dart';

import '../../../providers/themes_provider/theme_provider.dart';
import '../../../widgets/app_text.dart';
import '../../colors/app_colors.dart';
import 'categories_page.dart';
import 'menus_page.dart';

class MenuMainPage extends StatefulWidget {
  const MenuMainPage({super.key});

  @override
  State<MenuMainPage> createState() => _MenuMainPageState();
}

class _MenuMainPageState extends State<MenuMainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Menus",
          fontWeight: FontWeight.bold,
          fontSize: context.largeText * 0.8,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.blueColor,
          unselectedLabelColor: AppColors.greyColor,
          indicatorColor: AppColors.blueColor,
          tabs: const [
            Tab(text: 'Tous les Menus'),
            Tab(text: 'Par Catégories'),
          ],
          dividerColor: Colors.transparent,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MenusPage(),
          CategoriesPage(),
        ],
      ),
    );
  }
}
