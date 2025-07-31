// Modèle principal représentant une Transaction entière
import 'package:ned_food_admin/models/transaction_item_model.dart';

class TransactionModel {
  final String idTransaction;                   // ID unique de la Transaction
  final String customerName;                    // Nom du client
  final List<TransactionItemModel> items;       // Liste des articles achetés
  final double totalAmount;                     // Montant total de la commande
  final DateTime date;                          // Date et heure de la Transaction
  final String status;                          // Statut (Ex : "Payé", "En attente", etc.)
  final String paymentMethod;                   // Mode de paiement (ex: "Mobile Money", "Cash")

  TransactionModel({
    required this.idTransaction,
    required this.customerName,
    required this.items,
    required this.totalAmount,
    required this.date,
    required this.status,
    required this.paymentMethod,
  });
}
