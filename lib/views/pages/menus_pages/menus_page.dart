import 'package:flutter/material.dart';
import 'package:ned_food_admin/widgets/app_textField.dart';
import 'package:provider/provider.dart';

import '../../../providers/menu_provider/menu_provider.dart';
import '../../colors/app_colors.dart';
import '../../models_ui/body_with_border_top_radius.dart';
import '../../models_ui/menu_card_mini.dart';
import '../../models_ui/menu_details.dart';

class MenusPage extends StatefulWidget {
  const MenusPage({super.key});

  @override
  State<MenusPage> createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final allMenus = menuProvider.getAllMenus();

    // Filtrage selon la recherche
    final filteredMenus =
        allMenus
            .where(
              (menu) =>
                  menu.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                  menu.category.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
            )
            .toList();

    return Scaffold(

      body: BodyWithBorderTopRadius(
        child: Column(
          children: [
            // BARRE DE RECHERCHE
            AppTextField(
              label: "Rechercher un menu...",
              prefixIcon: Icons.search,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.blueColor, width: 2)
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
                  
            // LISTE DES MENUS
            Expanded(
              child:
                  filteredMenus.isEmpty
                      ? const Center(child: Text("Aucun menu trouvé 😥"))
                      : ListView.builder(
                        itemCount: filteredMenus.length,
                        itemBuilder: (context, index) {
                          final menu = filteredMenus[index];
                          return MenuCardMini(
                            menu: menu,
                            onTap: () {
                              showMenuDetails(context, menu);
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR AVEC awesome_bottom_bar
      // bottomNavigationBar: BottomBarCreative(
      //   items: const [
      //     TabItem(icon: Icons.restaurant, title: 'Menus'),
      //     TabItem(icon: Icons.category, title: 'Catégories'),
      //     TabItem(icon: Icons.add_circle, title: 'Ajouter'),
      //     TabItem(icon: Icons.settings, title: 'Paramètres'),
      //   ],
      //   backgroundColor: Colors.white,
      //   color: Colors.grey,
      //   colorSelected: Colors.blueAccent,
      //   indexSelected: 0,
      //   onTap: (index) {
      //     // À gérer : navigation entre pages
      //   },
      // ),
    );
  }
}
