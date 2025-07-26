// Modèle principal représentant une Order entière
import 'package:ned_food_admin/models/order_item_model.dart';

class OrderModel {
  final String idOrder;                   // ID unique de la Order
  final String customerName;                    // Nom du client
  final List<OrderItemModel> items;       // Liste des articles achetés
  final double totalAmount;                     // Montant total de la commande
  final DateTime date;                          // Date et heure de la Order
  final String status;                          // Statut (Ex : "Payé", "En attente", etc.)
  final String paymentMethod;                   // Mode de paiement (ex: "Mobile Money", "Cash")

  OrderModel({
    required this.idOrder,
    required this.customerName,
    required this.items,
    required this.totalAmount,
    required this.date,
    required this.status,
    required this.paymentMethod,
  });
}
