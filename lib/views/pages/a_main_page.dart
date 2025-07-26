import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:ned_food_admin/constants/routes.dart';
import 'package:ned_food_admin/views/pages/a_homepage.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:ned_food_admin/widgets/app_text.dart';
import 'package:provider/provider.dart';

import '../../providers/themes_provider/theme_provider.dart';
import '../colors/app_colors.dart';

class AMainPage extends StatefulWidget {
  const AMainPage({super.key});

  @override
  State<AMainPage> createState() => _AMainPageState();
}

class _AMainPageState extends State<AMainPage> {

  int selectedIndex = 0;

  //Page view controller
  final PageController _pageViewController = PageController();

  //Listes des icônes du bottom bar
  final List<TabItem> items = const [
    TabItem(icon: Icons.home, title: 'Accueil'),
    TabItem(icon: Icons.message, title: 'Messagerie'),
  ];

  // Listes des pages du mainPage
  final List<Widget> _pages = [
    const AHomepage(),
    Center(child: AppText(text: "Messagérie",),)
  ];

  @override
  Widget build(BuildContext context) {
    ///Pour gérer le mode dark/light
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      ///AppBar
      appBar: AppBar(
        title: AppText(
          text: "NedFood Admin",
          fontWeight: FontWeight.bold,
          fontSize: context.largeText * 0.8,
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),

      ///Body
      body: Center(
        child: PageView.builder(
          itemCount: _pages.length,
          controller: _pageViewController,
          onPageChanged: (index) {
            setState(() {
              if (index == _pages.length) {
                selectedIndex = _pages.length - 1;
              } else {
                selectedIndex= index;
              }
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return _pages[selectedIndex];
          },
        ),
      ),


      ///BottomBar
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: AppColors.primaryColor(context),
        color: AppColors.themeColorInverse(context),
        itemStyle: ItemStyle.hexagon,
        colorSelected: AppColors.themeColorInverse(context),
        indexSelected: selectedIndex,

        onTap: (int index) => setState(() => selectedIndex = index),
      ),
    );
  }
}
