import 'menu_model.dart';

/// Modèle représentant une catégorie de menus (ex : Pizzas, Boissons...)
class CategoryModel {
  /// Identifiant unique de la catégorie
  final String idCategory;

  /// Nom de la catégorie (ex : "Pizzas")
  final String name;

  /// Liste des menus associés à cette catégorie
  final List<MenuModel> menus;

  CategoryModel({
    required this.idCategory,
    required this.name,
    required this.menus,
  });
}
