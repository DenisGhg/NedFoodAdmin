import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/models_ui/body_with_border_top_radius.dart';
import 'package:provider/provider.dart';

import '../../../../models/order_model.dart';
import '../../../../providers/order_provider/order_provider.dart';
import '../../../models_ui/order_card.dart';
import '../../../models_ui/order_details.dart';

class ReadyOrdersPage extends StatelessWidget {
  const ReadyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);

    //Les ordres avec statut Confirmée
    List<OrderModel> orders = provider.getOrdersByStatus("Confirmée");
    return Scaffold(
      body: BodyWithBorderTopRadius(
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderCard(
              order: order,
              onTap:
                  () => showOrderDetails(
                context,
                order,
              ),
            );
          },

        ),
      ),
    );
  }
}
