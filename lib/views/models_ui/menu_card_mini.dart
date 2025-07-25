import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/colors/app_colors.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

import '../../models/menu_model.dart';
import '../../widgets/app_text.dart';


/// Widget compact d'affichage d'un menu (utilisé dans la liste de MenusPage)
class MenuCardMini extends StatelessWidget {
  final MenuModel menu;
  final VoidCallback onTap;

  const MenuCardMini({
    super.key,
    required this.menu,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            menu.imagePath,
            width: context.referenceSize * 5,
            height: context.referenceSize * 5,
            fit: BoxFit.cover,
          ),
        ),
        title: AppText(
          text:  menu.name,
          fontWeight: FontWeight.bold,
        ),
        subtitle: AppText(
          text: 'Stock: ${menu.stock} | ${menu.price.toStringAsFixed(0)} FCFA',
          color: AppColors.greyColor,
          fontSize: context.smallText,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
