import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:provider/provider.dart';

import '../../../../providers/transaction_provider/transaction_provider.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/app_textField.dart';
import '../../../colors/app_colors.dart';
import '../../../models_ui/body_with_border_top_radius.dart';
import '../../../models_ui/transaction_card.dart';
import '../../../models_ui/transaction_details.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
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
    final provider = Provider.of<TransactionProvider>(context);

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
                provider.filterTransactions(query);
              },
            ),

            //  Liste des transactions
            Expanded(
              child:
              provider.isSearching
                  ? provider.filteredTransactions.isEmpty
                  ? Center(
                child: AppText(text: 'Aucun résultat trouvé'),
              )
                  : ListView.builder(
                itemCount: provider.filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction =
                  provider.filteredTransactions[index];
                  return TransactionCard(
                    transaction: transaction,
                    onTap:
                        () => showTransactionDetails(
                      context,
                      transaction,
                    ),
                  );
                },
              )
                  : ListView.builder(
                itemCount: provider.allTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = provider.allTransactions[index];
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
          ],
        ),
      ),
    );
  }
}
