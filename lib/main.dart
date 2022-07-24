import 'dart:convert';
import 'package:drink_dispenser/models/menu.dart';
import 'package:drink_dispenser/providers/menu_provider.dart';
import 'package:drink_dispenser/screens/type_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String menuData = await rootBundle.loadString('assets/menu.json');
  Menu menu = Menu.fromJson(jsonDecode(menuData));

  runApp(App(menu: menu));
}

class App extends StatelessWidget {

  final Menu menu;

  const App({required this.menu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuProvider(
      menu: menu,
      child: const MaterialApp(
        home: TypeChooser(),
      ),
    );
  }
}