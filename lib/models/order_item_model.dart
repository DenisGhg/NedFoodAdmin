// Modèle représentant un item acheté dans une Order
class OrderItemModel {
  final String itemName;     // Nom du produit/plat
  final int quantity;        // Quantité achetée
  final double unitPrice;    // Prix unitaire

  OrderItemModel({
    required this.itemName,
    required this.quantity,
    required this.unitPrice,
  });

  // Calcule le prix total pour cet item
  double get totalPrice => quantity * unitPrice;
}
