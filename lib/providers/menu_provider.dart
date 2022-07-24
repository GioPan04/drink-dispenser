import 'package:drink_dispenser/models/menu.dart';
import 'package:flutter/material.dart';

class MenuProvider extends InheritedWidget {
  final Menu menu;

  const MenuProvider({
    required this.menu,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(MenuProvider oldWidget) => menu != oldWidget.menu;

  static MenuProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MenuProvider>()!;
}