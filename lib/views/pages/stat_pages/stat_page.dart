import 'package:flutter/material.dart';
import 'package:ned_food_admin/constants/images_paths.dart';
import 'package:ned_food_admin/views/models_ui/body_with_border_top_radius.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

import '../../../widgets/app_text.dart';
import '../../colors/app_colors.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données fictives
    final topMenus = [
      {'name': 'Burger Royal', 'sold': 120, 'total': 240000},
      {'name': 'Pizza Béninoise', 'sold': 95, 'total': 190000},
      {'name': 'Sandwich Poulet', 'sold': 80, 'total': 160000},
      {'name': 'Tacos XL', 'sold': 75, 'total': 150000},
      {'name': 'Salade Fraîche', 'sold': 60, 'total': 120000},
    ];

    //  Liste centralisée des infos des InfotCards
    final List<Map<String, dynamic>> infoData = [
      {
        'icon': Icons.attach_money,
        'title': "Revenus",
        'value': '20000000 FCFA',
      },
      {
        'icon': Icons.people,
        'title': "Clients",
        'value': '50',

      },
      {
        'icon': Icons.shopping_cart,
        'title': "Commandes",
        'value': '800',
      },
      {
        'icon': Icons.restaurant_menu,
        'title': "Menus",
        'value': '42',
      },
    ];


    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Statistiques", fontWeight: FontWeight.bold, fontSize: context.largeText,),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) =>[
              PopupMenuItem(child: AppText(text: "Aujourd'hui")),
              PopupMenuItem(child: AppText(text: 'Cette semaine')),
              PopupMenuItem(child: AppText(text: 'Ce mois')),
            ],
          ),
        ],
      ),
      body: BodyWithBorderTopRadius(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.defaultPagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Graphique (image simulée)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    ImagesPaths.STATIMAGE,
                    fit: BoxFit.cover,
                    height: context.screenHeight * 0.25,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: context.defaultSpacing,),

              //  Top 5 menus
              AppText(text: "Top 5 des menus les plus vendus", fontSize: context.mediumText, fontWeight: FontWeight.bold,),
              SizedBox(height: context.defaultSpacing,),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topMenus.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = topMenus[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryColor(context),
                      child: AppText(text: '#${index + 1}'),
                    ),
                    title: AppText(text: "${item['name']}"),
                    subtitle: AppText(text: '${item['sold']} vendus'),
                    trailing: AppText(text: '${item['total']} FCFA'),
                  );
                },
              ),
              SizedBox(height: context.defaultSpacing,),

              //  Cartes de stats
              AppText(text: "Résumé", fontSize: context.mediumText, fontWeight: FontWeight.bold,),
              SizedBox(height: context.defaultSpacing,),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                children: infoData.map((data) {
                  return InfotCard(
                    icon: data['icon'],
                    title: data['title'],
                    value: data['value'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// InfotCard widget
class InfotCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfotCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.4,
      height: context.screenHeight * 0.25,
      padding: EdgeInsets.all(context.defaultPagePadding),
      decoration: BoxDecoration(
        color: AppColors.primaryColor(context),
        borderRadius: BorderRadius.circular(context.referenceSize * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: context.referenceSize * 3, color: AppColors.blueColor,),
          const SizedBox(height: 8),
          AppText(text: title, color: AppColors.greyColor,),
          const SizedBox(height: 4),
          AppText(text: value, fontSize: context.smallText,),
        ],
      ),
    );
  }
}
