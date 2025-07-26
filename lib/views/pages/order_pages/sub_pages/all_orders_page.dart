import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:provider/provider.dart';

import '../../../../providers/order_provider/order_provider.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/app_textField.dart';
import '../../../colors/app_colors.dart';
import '../../../models_ui/body_with_border_top_radius.dart';
import '../../../models_ui/order_card.dart';
import '../../../models_ui/order_details.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({super.key});

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  //Controller du champ de recherche
  late TextEditingController _searchController;


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Accès au provider
    final provider = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: BodyWithBorderTopRadius(
        child: Column(
          children: [
            // Barre de recherche
            AppTextField(
              controller: _searchController,
              label: "Rechercher par ID ou client...",
              prefixIcon: Icons.search,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.referenceSize),
                borderSide: BorderSide(
                  color: AppColors.primaryColor(context),
                  width: 2,
                ),
              ),
              onChanged: (query) {
                //  Filtrage en direct
                provider.filterOrders(query);
              },
            ),

            //  Liste des orders
            Expanded(
              child:
              provider.isSearching
                  ? provider.filteredOrders.isEmpty
                  ? Center(
                child: AppText(text: 'Aucun résultat trouvé'),
              )
                  : ListView.builder(
                itemCount: provider.filteredOrders.length,
                itemBuilder: (context, index) {
                  final order =
                  provider.filteredOrders[index];
                  return OrderCard(
                    order: order,
                    onTap:
                        () => showOrderDetails(
                      context,
                      order,
                    ),
                  );
                },
              )
                  : ListView.builder(
                itemCount: provider.allOrders.length,
                itemBuilder: (context, index) {
                  final order = provider.allOrders[index];
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
          ],
        ),
      ),
    );
  }
}
