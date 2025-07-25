import 'package:flutter/material.dart';
import 'package:ned_food_admin/constants/images_paths.dart';

import '../../models/menu_model.dart';


/// Provider pour gérer les menus de l'application (ajout, suppression, filtrage, etc.)
class MenuProvider with ChangeNotifier {
  /// Map contenant les menus classés par catégorie

  final Map<String, List<MenuModel>> _menuMap = {
    'Plats': [
      MenuModel(
        idMenu: '1',
        name: 'Poulet Braisé',
        category: 'Plats',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 12,
        description: 'Délicieux poulet braisé accompagné d’alloco.',
        price: 3500,
      ),
      MenuModel(
        idMenu: '2',
        name: 'Riz Sauce Arachide',
        category: 'Plats',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 8,
        description: 'Riz blanc avec une sauce à base d’arachide et viande.',
        price: 2500,
      ),
    ],
    'Boissons': [
      MenuModel(
        idMenu: '3',
        name: 'Jus de Bissap',
        category: 'Boissons',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 20,
        description: 'Jus naturel à base de fleurs d’hibiscus.',
        price: 1000,
      ),
      MenuModel(
        idMenu: '4',
        name: 'Yaourt local',
        category: 'Boissons',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 15,
        description: 'Yaourt fait maison sucré et rafraîchissant.',
        price: 1200,
      ),
    ],
    'Desserts': [
      MenuModel(
        idMenu: '5',
        name: 'Tô à la banane',
        category: 'Desserts',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 10,
        description: 'Gâteau béninois à base de banane et farine de maïs.',
        price: 1800,
      ),
      MenuModel(
        idMenu: '6',
        name: 'Beignets sucrés',
        category: 'Desserts',
        imagePath: ImagesPaths.MENUIMAGE,
        stock: 25,
        description: 'Beignets croustillants et dorés au sucre.',
        price: 500,
      ),
    ],
  };

  /// Getter : retourne la map complète des menus
  Map<String, List<MenuModel>> get menuMap => _menuMap;

  /// Ajoute un menu dans la bonne catégorie
  void addMenu(MenuModel menu) {
    if (_menuMap.containsKey(menu.category)) {
      _menuMap[menu.category]!.add(menu);
    } else {
      _menuMap[menu.category] = [menu];
    }
    notifyListeners();
  }

  /// Supprime un menu à partir de son ID et sa catégorie
  void removeMenu(String idMenu, String category) {
    if (_menuMap.containsKey(category)) {
      _menuMap[category]!.removeWhere((menu) => menu.idMenu == idMenu);
      // Optionnel : supprimer la catégorie si elle est vide
      if (_menuMap[category]!.isEmpty) {
        _menuMap.remove(category);
      }
      notifyListeners();
    }
  }

  /// Modifie un menu existant (basé sur l'idMenu)
  void updateMenu(MenuModel updatedMenu) {
    final category = updatedMenu.category;
    if (_menuMap.containsKey(category)) {
      final index = _menuMap[category]!.indexWhere((menu) => menu.idMenu == updatedMenu.idMenu);
      if (index != -1) {
        _menuMap[category]![index] = updatedMenu;
        notifyListeners();
      }
    }
  }

  /// Recherche des menus contenant le mot-clé (dans le nom ou la description)
  List<MenuModel> searchMenus(String keyword) {
    final lowerKeyword = keyword.toLowerCase();
    return _menuMap.values.expand((menus) => menus).where((menu) {
      return menu.name.toLowerCase().contains(lowerKeyword) ||
          menu.description.toLowerCase().contains(lowerKeyword);
    }).toList();
  }

  /// Récupère tous les menus de toutes les catégories
  List<MenuModel> getAllMenus() {
    return _menuMap.values.expand((menus) => menus).toList();
  }

  /// Récupère les menus d'une catégorie spécifique
  List<MenuModel> getMenusByCategory(String category) {
    return _menuMap[category] ?? [];
  }
}
