// Bottom Sheet avec détails + options
import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

import '../../constants/routes.dart';
import '../../models/menu_model.dart';
import '../../widgets/app_text.dart';
import '../colors/app_colors.dart';

void showMenuDetails(BuildContext context, MenuModel menu) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: menu.name, fontWeight: FontWeight.bold,),
            const SizedBox(height: 8),
            AppText(text: "Catégorie : ${menu.category}", fontSize: context.mediumText * 0.8,),
            AppText(text: "Prix : ${menu.price} FCFA", fontSize: context.mediumText * 0.8,),
            AppText(text: "Stock : ${menu.stock}", fontSize: context.mediumText * 0.8,),
            const SizedBox(height: 12),
            AppText(text: menu.description, fontSize: context.mediumText * 0.8,),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //Bouton Editer
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ADDOREDITMENUPAGE, arguments: menu);
                  },
                  icon: const Icon(Icons.edit),
                  label: AppText(text: "Modifier",),
                ),


                //Bouton supprimer
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Action de suppression
                  },
                  icon: const Icon(Icons.delete),
                  label: AppText(text: "Supprimer"),
                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.redColor),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}