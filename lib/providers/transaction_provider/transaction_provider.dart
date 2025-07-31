import 'package:flutter/material.dart';
import '../../models/transaction_item_model.dart';
import '../../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  // Liste principale de toutes les transactions
  final List<TransactionModel> _allTransactions = [
    
    TransactionModel(
      idTransaction: 'TNX001',
      customerName: 'Jean Dupont',
      items: [
        TransactionItemModel(itemName: 'Burger', quantity: 2, unitPrice: 1500),
        TransactionItemModel(itemName: 'Frites', quantity: 1, unitPrice: 1000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Confirmée',
      paymentMethod: 'Mobile Money',
    ),
    TransactionModel(
      idTransaction: 'TNX006',
      customerName: 'Nadine Gbagbo',
      items: [
        TransactionItemModel(itemName: 'Soupe de poisson', quantity: 1, unitPrice: 2800),
      ],
      totalAmount: 2800,
      date: DateTime.now().subtract(Duration(days: 4)),
      status: 'En attente',
      paymentMethod: 'Carte bancaire',
    ),
    TransactionModel(
      idTransaction: 'TNX021',
      customerName: 'Aristide Boko',
      items: [
        TransactionItemModel(itemName: 'Fufu + sauce arachide', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Annulée',
      paymentMethod: 'Carte bancaire',
    ),
    TransactionModel(
      idTransaction: 'TNX002',
      customerName: 'Amina Traoré',
      items: [
        TransactionItemModel(itemName: 'Tacos', quantity: 1, unitPrice: 2500),
      ],
      totalAmount: 2500,
      date: DateTime.now().subtract(Duration(days: 3)),
      status: 'Confirmée',
      paymentMethod: 'Carte bancaire',
    ),
    TransactionModel(
      idTransaction: 'TNX003',
      customerName: 'Moussa Diallo',
      items: [
        TransactionItemModel(itemName: 'Pizza', quantity: 1, unitPrice: 4000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(hours: 12)),
      status: 'Confirmée',
      paymentMethod: 'Cash',
    ),

    // En attente
    TransactionModel(
      idTransaction: 'TNX004',
      customerName: 'Fatou Sissoko',
      items: [
        TransactionItemModel(itemName: 'Poulet braisé', quantity: 1, unitPrice: 3500),
        TransactionItemModel(itemName: 'Jus naturel', quantity: 2, unitPrice: 800),
      ],
      totalAmount: 5100,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'En attente',
      paymentMethod: 'Cash',
    ),
    TransactionModel(
      idTransaction: 'TNX005',
      customerName: 'Koffi Mensah',
      items: [
        TransactionItemModel(itemName: 'Salade César', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'En attente',
      paymentMethod: 'Mobile Money',
    ),

    TransactionModel(
      idTransaction: 'TNX019',
      customerName: 'Franck Tchibozo',
      items: [
        TransactionItemModel(itemName: 'Assiette poisson frit', quantity: 1, unitPrice: 3500),
      ],
      totalAmount: 3500,
      date: DateTime.now().subtract(Duration(days: 5)),
      status: 'Annulée',
      paymentMethod: 'Mobile Money',
    ),
    TransactionModel(
      idTransaction: 'TNX020',
      customerName: 'Josiane Kouadio',
      items: [
        TransactionItemModel(itemName: 'Tô + sauce gombo', quantity: 1, unitPrice: 2500),
      ],
      totalAmount: 2500,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'Annulée',
      paymentMethod: 'Cash',
    ),
    TransactionModel(
      idTransaction: 'TNX021',
      customerName: 'Aristide Boko',
      items: [
        TransactionItemModel(itemName: 'Fufu + sauce arachide', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Annulée',
      paymentMethod: 'Carte bancaire',
    ),
  ];

  List<TransactionModel> get allTransactions => _allTransactions;

  // 🔍 Liste affichée dans l'UI, filtrée ou non
  List<TransactionModel> _filteredTransactions = [];
  List<TransactionModel> get filteredTransactions => _filteredTransactions;

  bool _isSearching = false;
  bool get isSearching => _isSearching;


  // 🔍 Méthode de filtre par ID ou nom client
  void filterTransactions(String query) {
    _isSearching = query.trim().isNotEmpty; // ✅ON ACTIVE LA RECHERCHE

    if (!_isSearching) {
      _filteredTransactions = [];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredTransactions = _allTransactions.where((transaction) {
        return transaction.idTransaction.toLowerCase().contains(lowerQuery) ||
            transaction.customerName.toLowerCase().contains(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }
  //Pour récuperer l'ordre grâce à son statut
  List<TransactionModel> getTransactionsByStatus(String status) {
    return _allTransactions.where((transaction) => transaction.status == status).toList();
  }

  // Pour réinitialiser le filtre si besoin
  void resetFilter() {
    _filteredTransactions = [];
    _isSearching = false;
    notifyListeners();
  }
}
