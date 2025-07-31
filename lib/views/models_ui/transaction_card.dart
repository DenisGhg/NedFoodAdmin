import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import '../../models/transaction_model.dart';
import '../../utils/app_format.dart';
import '../../widgets/app_text.dart';


class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.transaction,
    this.onTap,
  });

  // Méthode utilitaire pour la couleur du statut
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmée':
        return Colors.blueAccent;
      case 'en attente':
        return Colors.orange;
      case 'annulée':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: context.referenceSize),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.primaryColor(context),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(context.defaultPagePadding),
        title: AppText(
          text: transaction.customerName,
          fontWeight: FontWeight.bold,
          fontSize: context.mediumText,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.referenceSize),
            AppText(text: "ID Transaction : ${transaction.idTransaction}",),
            SizedBox(height: context.referenceSize,),

            AppText(
              text: 'Montant: ${AppFormat.currency(transaction.totalAmount)}',
            ),
            SizedBox(height: context.referenceSize),
            AppText(
              text: 'Date: ${AppFormat.date(transaction.date)}',
              color: AppColors.greyColor,
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusColor(transaction.status).withOpacity(0.15),
            borderRadius: BorderRadius.circular(context.defaultPagePadding),
          ),
          child: AppText(
            text: transaction.status,
            fontWeight: FontWeight.bold,
            color: _getStatusColor(transaction.status),
            fontSize: context.smallText,
          ),
        ),
      ),
    );
  }
}
