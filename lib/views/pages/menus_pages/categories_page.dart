import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/menu_provider/menu_provider.dart';
import '../../models_ui/body_with_border_top_radius.dart';
import '../../models_ui/menu_card_mini.dart';
import '../../models_ui/menu_details.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    final menuProvider = context.read<MenuProvider>();
    categories = menuProvider.menuMap.keys.toList();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<MenuProvider>();

    return BodyWithBorderTopRadius(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Onglets horizontaux
          Material(
            color: Colors.transparent,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.blueColor,
              unselectedLabelColor: AppColors.greyColor,
              indicatorColor: AppColors.blueColor,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              dividerColor: Colors.transparent, // supprime le trait
              tabs: categories.map((cat) => Tab(text: cat)).toList(),
            ),
          ),
      
          //  Contenu des menus de chaque catégorie
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((categoryName) {
                final menus = menuProvider.getMenusByCategory(categoryName);
                return menus.isEmpty
                    ? const Center(
                    child: Text("Aucun menu dans cette catégorie"))
                    : ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    final menu = menus[index];
                    return MenuCardMini(
                      menu: menu,
                      onTap: () {
                        showMenuDetails(context, menu);
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
