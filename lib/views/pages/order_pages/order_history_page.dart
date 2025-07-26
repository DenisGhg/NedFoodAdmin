import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/all_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/canceled_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/confirmed_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/delivered_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/in_preparation_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/out_for_delivery_order_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/pending_payment_orders_page.dart';
import 'package:ned_food_admin/views/pages/order_pages/sub_pages/ready_orders_page.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

import '../../../widgets/app_text.dart';
import '../../colors/app_colors.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> with SingleTickerProviderStateMixin {
  //Controller de la tabview
  late TabController _tabController;

  //Les en-têtes
  final List<Tab> _items = [
    Tab(text: "Tous", icon: Icon(Icons.list),),
    Tab(text: "Confirmées", icon: Icon(Icons.check_circle_outline),),
    Tab(text: "En attente", icon: Icon(Icons.schedule),),
    Tab(text: "En préparation", icon: Icon(Icons.soup_kitchen),),
    Tab(text: "Prêtes", icon: Icon(Icons.outbox)),
    Tab(text: "En livraison", icon: Icon(Icons.delivery_dining),),
    Tab(text: "Livrées", icon: Icon(Icons.check_circle_outlined),),
    Tab(text: "Annulées", icon: Icon(Icons.cancel),),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _items.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Historique des Commandes',
          fontWeight: FontWeight.bold,
          fontSize: context.largeText * 0.8,
        ),
        centerTitle: true,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: AppColors.blueColor,
          unselectedLabelColor: AppColors.greyColor,
          indicatorColor: AppColors.blueColor,
          tabs: _items,
          dividerColor: Colors.transparent,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AllOrdersPage(),
          ConfirmedOrdersPage(),
          PendingPaymentOrdersPage(),
          InPreparationOrdersPage(),
          ReadyOrdersPage(),
          OutForDeliveryOrdersPage(),
          DeliveredOrdersPage(),
          CanceledOrdersPage(),
        ],
      ),

    );
  }
}
