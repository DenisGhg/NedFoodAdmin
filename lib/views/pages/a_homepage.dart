import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/models_ui/body_with_border_top_radius.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:ned_food_admin/widgets/app_text.dart';

import '../../constants/routes.dart';

class AHomepage extends StatefulWidget {
  const AHomepage({super.key});

  @override
  State<AHomepage> createState() => _AHomepageState();
}

class _AHomepageState extends State<AHomepage> {

  //Liste de Menus avec MenuCard
  final List<MenuCard> _menus = [
    MenuCard(title: 'Menus', icon: Icons.store, routeName: AppRoutes.MENUMAINPAGE,),
    MenuCard(title: 'Statistiques', icon: Icons.bar_chart, routeName: AppRoutes.STATPAGE,),
    MenuCard(title: 'Commandes', icon: Icons.list_alt, routeName: AppRoutes.ORDERHISTORYPAGE,),
    MenuCard(title: 'Historique', icon: Icons.history, routeName: AppRoutes.MENUMAINPAGE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Body
      body: BodyWithBorderTopRadius(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatsCarousel(),
            SizedBox(height: context.defaultSpacing),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: _menus,
              ),
            ),
          ],
        ),
      ),

      //Bouton d'ajout de menu
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, AppRoutes.ADDOREDITMENUPAGE),
        backgroundColor: AppColors.primaryColor(context),
        child: Icon(Icons.add),
      ),
    );
  }

}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.defaultPagePadding),
      width: context.screenWidth / 2 - 32,
      padding: EdgeInsets.all(context.defaultPagePadding),
      decoration: BoxDecoration(
        color: AppColors.primaryColor(context),
        borderRadius: BorderRadius.circular(context.defaultPagePadding),
      ),
      child: Column(
        children: [
          AppText(
            text: value,
            fontWeight: FontWeight.bold,
            fontSize: context.largeText * 0.8,
          ),
          SizedBox(height: context.referenceSize),
          AppText(
            text: title,
            fontWeight: FontWeight.bold,
            color: AppColors.greyColor,
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const MenuCard({super.key, required this.title, required this.icon, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        padding: EdgeInsets.all(context.defaultPagePadding),
        decoration: BoxDecoration(
          color: AppColors.primaryColor(context),
          borderRadius: BorderRadius.circular(context.referenceSize * 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: context.referenceSize * 4,
              color: AppColors.blueColor,
            ),
            SizedBox(height: context.referenceSize),
            AppText(text: title, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}

class StatsCarousel extends StatefulWidget {
  const StatsCarousel({super.key});

  @override
  State<StatsCarousel> createState() => _StatsCarouselState();
}

class _StatsCarouselState extends State<StatsCarousel> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  int _currentIndex = 0;
  late Timer _timer;

  final List<Map<String, String>> _stats = [
    {'title': 'Commandes', 'value': '120'},
    {'title': 'Revenus', 'value': '45 000 FCFA'},
    {'title': 'Clients', 'value': '98'},
    {'title': 'Produits', 'value': '56'},
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  int _getRealIndex(int index) => index % _stats.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.15,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final realIndex = _getRealIndex(index);
                final stat = _stats[realIndex];
                return StatCard(title: stat['title']!, value: stat['value']!);
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_stats.length, (index) {
              final isActive = _getRealIndex(_currentIndex) == index;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 10 : 6,
                height: isActive ? 10 : 6,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.blueColor : AppColors.greyColor,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
