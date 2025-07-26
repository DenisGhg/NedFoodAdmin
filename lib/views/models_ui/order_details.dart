import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:ned_food_admin/widgets/app_text.dart';
import '../../models/order_model.dart';

void showOrderDetails(
  BuildContext context,
  OrderModel order,
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
              text: 'Détails de la order',
              fontSize: context.mediumText * 1.3,
            ),
            SizedBox(height: context.defaultSpacing),

            // Date complète
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Date :'),
                AppText(text: order.date.toString()),
              ],
            ),
            SizedBox(height: context.defaultSpacing),

            // Paiement
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Paiement :'),
                AppText(text: order.paymentMethod),
              ],
            ),
            SizedBox(height: context.defaultSpacing),

            //Id de la order
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: "Order ID : "),
                AppText(text: order.idOrder),
              ],
            ),
            SizedBox(height: context.defaultSpacing,),

            //  Statut
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppText(text: 'Statut :'), AppText(text: order.status)],
            ),
            SizedBox(height: context.defaultSpacing,),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Montant total :'),
                AppText(text: '${order.totalAmount.toStringAsFixed(2)} FCFA'),
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

            ...order.items.map(
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
