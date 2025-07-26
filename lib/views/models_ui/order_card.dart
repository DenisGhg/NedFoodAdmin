import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import '../../models/order_model.dart';
import '../../utils/app_format.dart';
import '../../widgets/app_text.dart';


class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  // Méthode utilitaire pour la couleur du statut
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmée':
        return Colors.blueAccent;
      case 'en attente':
        return Colors.orange;
      case 'en préparation':
        return Colors.amber;
      case 'prête':
        return Colors.lightGreen;
      case 'en livraison':
        return Colors.deepPurple;
      case 'livrée':
        return Colors.green;
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
          text: order.customerName,
          fontWeight: FontWeight.bold,
          fontSize: context.mediumText,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.referenceSize),
            AppText(text: "ID Order : ${order.idOrder}",),
            SizedBox(height: context.referenceSize,),

            AppText(
              text: 'Montant: ${AppFormat.currency(order.totalAmount)}',
            ),
            SizedBox(height: context.referenceSize),
            AppText(
              text: 'Date: ${AppFormat.date(order.date)}',
              color: AppColors.greyColor,
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusColor(order.status).withOpacity(0.15),
            borderRadius: BorderRadius.circular(context.defaultPagePadding),
          ),
          child: AppText(
            text: order.status,
            fontWeight: FontWeight.bold,
            color: _getStatusColor(order.status),
            fontSize: context.smallText,
          ),
        ),
      ),
    );
  }
}
