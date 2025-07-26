import 'package:flutter/material.dart';
import '../../models/order_item_model.dart';
import '../../models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  // Liste principale de toutes les orders
  final List<OrderModel> _allOrders = [

    OrderModel(
      idOrder: 'ORD011',
      customerName: 'Mohamed Camara',
      items: [
        OrderItemModel(itemName: 'Thiebou djen', quantity: 1, unitPrice: 3500),
      ],
      totalAmount: 3500,
      date: DateTime.now().subtract(Duration(minutes: 30)),
      status: 'Prête',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD001',
      customerName: 'Jean Dupont',
      items: [
        OrderItemModel(itemName: 'Burger', quantity: 2, unitPrice: 1500),
        OrderItemModel(itemName: 'Frites', quantity: 1, unitPrice: 1000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Confirmée',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD007',
      customerName: 'Didier Kambou',
      items: [
        OrderItemModel(itemName: 'Riz sauce arachide', quantity: 2, unitPrice: 2000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(hours: 6)),
      status: 'En préparation',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD002',
      customerName: 'Amina Traoré',
      items: [
        OrderItemModel(itemName: 'Tacos', quantity: 1, unitPrice: 2500),
      ],
      totalAmount: 2500,
      date: DateTime.now().subtract(Duration(days: 3)),
      status: 'Confirmée',
      paymentMethod: 'Carte bancaire',
    ),
    OrderModel(
      idOrder: 'ORD003',
      customerName: 'Moussa Diallo',
      items: [
        OrderItemModel(itemName: 'Pizza', quantity: 1, unitPrice: 4000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(hours: 12)),
      status: 'Confirmée',
      paymentMethod: 'Cash',
    ),

    // En attente
    OrderModel(
      idOrder: 'ORD004',
      customerName: 'Fatou Sissoko',
      items: [
        OrderItemModel(itemName: 'Poulet braisé', quantity: 1, unitPrice: 3500),
        OrderItemModel(itemName: 'Jus naturel', quantity: 2, unitPrice: 800),
      ],
      totalAmount: 5100,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'En attente',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD005',
      customerName: 'Koffi Mensah',
      items: [
        OrderItemModel(itemName: 'Salade César', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'En attente',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD006',
      customerName: 'Nadine Gbagbo',
      items: [
        OrderItemModel(itemName: 'Soupe de poisson', quantity: 1, unitPrice: 2800),
      ],
      totalAmount: 2800,
      date: DateTime.now().subtract(Duration(days: 4)),
      status: 'En attente',
      paymentMethod: 'Carte bancaire',
    ),

    // En préparation

    OrderModel(
      idOrder: 'ORD008',
      customerName: 'Lucie Houngbédji',
      items: [
        OrderItemModel(itemName: 'Shawarma', quantity: 1, unitPrice: 2500),
      ],
      totalAmount: 2500,
      date: DateTime.now().subtract(Duration(hours: 2)),
      status: 'En préparation',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD009',
      customerName: 'Ahmed Ben Salah',
      items: [
        OrderItemModel(itemName: 'Tagine', quantity: 1, unitPrice: 3200),
      ],
      totalAmount: 3200,
      date: DateTime.now().subtract(Duration(hours: 1)),
      status: 'En préparation',
      paymentMethod: 'Carte bancaire',
    ),

    // Prêtes
    OrderModel(
      idOrder: 'ORD010',
      customerName: 'Sylvie Atchou',
      items: [
        OrderItemModel(itemName: 'Pastels', quantity: 3, unitPrice: 500),
      ],
      totalAmount: 1500,
      date: DateTime.now().subtract(Duration(minutes: 45)),
      status: 'Prête',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD011',
      customerName: 'Mohamed Camara',
      items: [
        OrderItemModel(itemName: 'Thiebou djen', quantity: 1, unitPrice: 3500),
      ],
      totalAmount: 3500,
      date: DateTime.now().subtract(Duration(minutes: 30)),
      status: 'Prête',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD012',
      customerName: 'Sarah Ouattara',
      items: [
        OrderItemModel(itemName: 'Pizza 4 fromages', quantity: 1, unitPrice: 4500),
      ],
      totalAmount: 4500,
      date: DateTime.now().subtract(Duration(minutes: 15)),
      status: 'Prête',
      paymentMethod: 'Carte bancaire',
    ),

    // En livraison
    OrderModel(
      idOrder: 'ORD013',
      customerName: 'Blaise Dossou',
      items: [
        OrderItemModel(itemName: 'Burger double', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(minutes: 10)),
      status: 'En livraison',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD014',
      customerName: 'Rita Mensah',
      items: [
        OrderItemModel(itemName: 'Sandwich viande', quantity: 2, unitPrice: 2000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(minutes: 8)),
      status: 'En livraison',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD015',
      customerName: 'Gaston Zongo',
      items: [
        OrderItemModel(itemName: 'Soupe gombo', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(minutes: 5)),
      status: 'En livraison',
      paymentMethod: 'Carte bancaire',
    ),

    // Livrées
    OrderModel(
      idOrder: 'ORD016',
      customerName: 'Rebecca Sagna',
      items: [
        OrderItemModel(itemName: 'Brochettes', quantity: 4, unitPrice: 1000),
      ],
      totalAmount: 4000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Livrée',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD017',
      customerName: 'Yves N’dri',
      items: [
        OrderItemModel(itemName: 'Riz blanc + sauce graine', quantity: 1, unitPrice: 2800),
      ],
      totalAmount: 2800,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'Livrée',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD018',
      customerName: 'Clémentine Adanou',
      items: [
        OrderItemModel(itemName: 'Akassa + sauce tomate', quantity: 1, unitPrice: 2200),
      ],
      totalAmount: 2200,
      date: DateTime.now().subtract(Duration(days: 3)),
      status: 'Livrée',
      paymentMethod: 'Carte bancaire',
    ),

    // Annulées
    OrderModel(
      idOrder: 'ORD019',
      customerName: 'Franck Tchibozo',
      items: [
        OrderItemModel(itemName: 'Assiette poisson frit', quantity: 1, unitPrice: 3500),
      ],
      totalAmount: 3500,
      date: DateTime.now().subtract(Duration(days: 5)),
      status: 'Annulée',
      paymentMethod: 'Mobile Money',
    ),
    OrderModel(
      idOrder: 'ORD020',
      customerName: 'Josiane Kouadio',
      items: [
        OrderItemModel(itemName: 'Tô + sauce gombo', quantity: 1, unitPrice: 2500),
      ],
      totalAmount: 2500,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'Annulée',
      paymentMethod: 'Cash',
    ),
    OrderModel(
      idOrder: 'ORD021',
      customerName: 'Aristide Boko',
      items: [
        OrderItemModel(itemName: 'Fufu + sauce arachide', quantity: 1, unitPrice: 3000),
      ],
      totalAmount: 3000,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Annulée',
      paymentMethod: 'Carte bancaire',
    ),
  ];

  List<OrderModel> get allOrders => _allOrders;

  // 🔍 Liste affichée dans l'UI, filtrée ou non
  List<OrderModel> _filteredOrders = [];
  List<OrderModel> get filteredOrders => _filteredOrders;

  bool _isSearching = false;
  bool get isSearching => _isSearching;


  // 🔍 Méthode de filtre par ID ou nom client
  void filterOrders(String query) {
    _isSearching = query.trim().isNotEmpty; // ✅ON ACTIVE LA RECHERCHE

    if (!_isSearching) {
      _filteredOrders = [];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredOrders = _allOrders.where((order) {
        return order.idOrder.toLowerCase().contains(lowerQuery) ||
            order.customerName.toLowerCase().contains(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }
  //Pour récuperer l'ordre grâce à son statut
  List<OrderModel> getOrdersByStatus(String status) {
    return _allOrders.where((order) => order.status == status).toList();
  }

  // Pour réinitialiser le filtre si besoin
  void resetFilter() {
    _filteredOrders = [];
    _isSearching = false;
    notifyListeners();
  }
}
