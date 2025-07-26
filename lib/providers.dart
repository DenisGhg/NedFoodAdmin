import 'package:ned_food_admin/providers/menu_provider/menu_provider.dart';
import 'package:ned_food_admin/providers/themes_provider/theme_provider.dart';
import 'package:ned_food_admin/providers/order_provider/order_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [

  //Theme
  ChangeNotifierProvider(create: (context) => ThemeProvider()),

  //Provider des menus
  ChangeNotifierProvider(create: (context) => MenuProvider()),

  //Historique de transaction
  ChangeNotifierProvider(create: (context) => OrderProvider()),

];