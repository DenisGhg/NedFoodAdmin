/// Modèle représentant un menu (produit alimentaire)
class MenuModel {
  /// Identifiant unique du menu
  final String idMenu;

  /// Catégorie à laquelle appartient ce menu (nom ou id)
  final String category;

  /// Nom du menu (ex : Pizza Royale)
  final String name;

  /// Chemin ou URL de l'image du menu
  final String imagePath;

  /// Description détaillée du menu
  final String description;

  /// Prix du menu
  final double price;

  /// Quantité en stock disponible
  final int stock;

  MenuModel({
    required this.idMenu,
    required this.category,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.stock,
  });
}
