// Modèle représentant un item acheté dans une Transaction
class TransactionItemModel {
  final String itemName;     // Nom du produit/plat
  final int quantity;        // Quantité achetée
  final double unitPrice;    // Prix unitaire

  TransactionItemModel({
    required this.itemName,
    required this.quantity,
    required this.unitPrice,
  });

  // Calcule le prix total pour cet item
  double get totalPrice => quantity * unitPrice;
}
