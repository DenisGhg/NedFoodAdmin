import 'package:flutter/material.dart';
import 'package:ned_food_admin/models/transaction_model.dart';
import 'package:ned_food_admin/views/models_ui/body_with_border_top_radius.dart';
import 'package:provider/provider.dart';

import '../../../../providers/transaction_provider/transaction_provider.dart';
import '../../../models_ui/transaction_card.dart';
import '../../../models_ui/transaction_details.dart';

class ConfirmedTransactionsPage extends StatelessWidget {
  const ConfirmedTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    //Les ordres avec statut Confirmée
    List<TransactionModel> transactions = provider.getTransactionsByStatus("Confirmée");
    return Scaffold(
      body: BodyWithBorderTopRadius(
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionCard(
              transaction: transaction,
              onTap:
                  () => showTransactionDetails(
                context,
                transaction,
              ),
            );
          },

        ),
      ),
    );
  }
}
