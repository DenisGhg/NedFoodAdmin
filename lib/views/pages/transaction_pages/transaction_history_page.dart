import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/pages/transaction_pages/sub_pages/all_transactions_page.dart';
import 'package:ned_food_admin/views/pages/transaction_pages/sub_pages/canceled_transactions_page.dart';
import 'package:ned_food_admin/views/pages/transaction_pages/sub_pages/confirmed_transactions_page.dart';
import 'package:ned_food_admin/views/pages/transaction_pages/sub_pages/pending_payment_transactions_page.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

import '../../../widgets/app_text.dart';
import '../../colors/app_colors.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> with SingleTickerProviderStateMixin {
  //Controller de la tabview
  late TabController _tabController;

  //Les en-têtes
  final List<Tab> _items = [
    Tab(text: "Tous", icon: Icon(Icons.list),),
    Tab(text: "En attente", icon: Icon(Icons.schedule),),
    Tab(text: "Confirmées", icon: Icon(Icons.check_circle_outline),),
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
          AllTransactionsPage(),
          PendingPaymentTransactionsPage(),
          ConfirmedTransactionsPage(),
          CanceledTransactionsPage(),
        ],
      ),

    );
  }
}
