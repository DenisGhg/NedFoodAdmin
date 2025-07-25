import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/models_ui/body_with_border_top_radius.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';
import 'package:provider/provider.dart';
import '../../../models/menu_model.dart';
import '../../../providers/menu_provider/menu_provider.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_textField.dart';
import '../../colors/app_colors.dart';

class AddOrEditMenuPage extends StatefulWidget {
  final MenuModel? existingMenu;

  const AddOrEditMenuPage({super.key, this.existingMenu, });

  @override
  State<AddOrEditMenuPage> createState() => _AddOrEditMenuPageState();
}

class _AddOrEditMenuPageState extends State<AddOrEditMenuPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingMenu != null) {
      _nameController.text = widget.existingMenu!.name;
      _categoryController.text = widget.existingMenu!.category;
      _priceController.text = widget.existingMenu!.price.toString();
      _stockController.text = widget.existingMenu!.stock.toString();
      _descriptionController.text = widget.existingMenu!.description;
      _imagePathController.text = widget.existingMenu!.imagePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context, listen: false);
    final isEdit = widget.existingMenu != null;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: isEdit ? "Modifier le menu" : "Ajouter un menu",
          fontWeight: FontWeight.bold,
          fontSize: context.largeText * 0.8,
        ),
        centerTitle: true,
      ),
      body: BodyWithBorderTopRadius(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    child: SizedBox(
                      height: context.screenHeight * 0.2,
                      width: double.infinity,
                      child: Center(
                        child: Icon(Icons.add_a_photo_outlined, size: context.referenceSize * 4,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _imagePathController,
                  label: 'Chemin de l’image (temporaire)',
                  prefixIcon: Icons.image,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _nameController,
                  label: 'Nom du menu',
                  prefixIcon: Icons.fastfood,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _categoryController,
                  label: 'Catégorie',
                  prefixIcon: Icons.category,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _priceController,
                  label: 'Prix (FCFA)',
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  validator: (value) => value == null || double.tryParse(value) == null ? 'Prix invalide' : null,
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _stockController,
                  label: 'Stock disponible',
                  prefixIcon: Icons.inventory,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || int.tryParse(value) == null ? 'Stock invalide' : null,
                ),
                SizedBox(height: context.referenceSize),
                AppTextField(
                  controller: _descriptionController,
                  label:  'Description du menu',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.blueColor, width: 2)
                  ),
                  prefixIcon: Icons.description,
                  maxLines: 4,
                  validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
                ),
                SizedBox(height: context.referenceSize),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.primaryColor(context),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final updatedMenu = MenuModel(
                        idMenu: widget.existingMenu?.idMenu ?? DateTime.now().millisecondsSinceEpoch.toString(),
                        name: _nameController.text.trim(),
                        category: _categoryController.text.trim(),
                        imagePath: _imagePathController.text.trim(),
                        description: _descriptionController.text.trim(),
                        price: double.parse(_priceController.text.trim()),
                        stock: int.parse(_stockController.text.trim()),
                      );

                      if (isEdit) {
                        menuProvider.updateMenu(updatedMenu);
                      } else {
                        menuProvider.addMenu(updatedMenu);
                      }

                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: AppText(
                    text: isEdit ? 'Modifier le menu' : 'Ajouter le menu',
                    fontWeight: FontWeight.bold,
                    fontSize: context.mediumText,
                    color: AppColors.themeColorInverse(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }
}
