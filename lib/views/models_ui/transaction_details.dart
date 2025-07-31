import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:ned_food_admin/widgets/app_text.dart';
import '../../models/transaction_model.dart';

void showTransactionDetails(
    BuildContext context,
    TransactionModel transaction,
    ) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryColor(context),
    builder: (ctx) {
      return Container(
        padding: EdgeInsets.all(context.defaultPagePadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Titre
            AppText(
              text: 'Détails de la transaction',
              fontSize: context.mediumText * 1.3,
            ),
            SizedBox(height: context.defaultSpacing),

            // Date complète
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Date :'),
                AppText(text: transaction.date.toString()),
              ],
            ),
            SizedBox(height: context.defaultSpacing),

            // Paiement
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Paiement :'),
                AppText(text: transaction.paymentMethod),
              ],
            ),
            SizedBox(height: context.defaultSpacing),

            //Id de la transaction
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "Transaction ID : "),
                AppText(text: transaction.idTransaction),
              ],
            ),
            SizedBox(height: context.defaultSpacing,),

            //  Statut
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText(text: 'Statut :'), AppText(text: transaction.status)],
            ),
            SizedBox(height: context.defaultSpacing,),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Montant total :'),
                AppText(text: '${transaction.totalAmount.toStringAsFixed(2)} FCFA'),
              ],
            ),
            SizedBox(height: context.defaultSpacing,),

            // Liste des articles achetés
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                text: 'Articles achetés:',
              ),
            ),

            ...transaction.items.map(
                  (item) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(text: item.itemName, fontSize: context.smallText * 1.2,),
                subtitle: AppText(text: '${item.quantity} × ${item.unitPrice} FCFA', fontSize: context.smallText * 1.1,),
                trailing: AppText(
                  text: '${(item.quantity * item.unitPrice).toStringAsFixed(2)} FCFA',
                  fontSize: context.smallText * 1.1,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
