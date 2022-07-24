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
      child: FakeDevicePixelRatio(
        fakeDevicePixelRatio: 1.367054,
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: const TypeChooser(),
        ),
      ),
    );
  }
}

class FakeDevicePixelRatio extends StatelessWidget {
  final num fakeDevicePixelRatio;
  final Widget child;

  const FakeDevicePixelRatio({required this.fakeDevicePixelRatio, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratio = fakeDevicePixelRatio / WidgetsBinding.instance.window.devicePixelRatio;
    
    return FractionallySizedBox(
      widthFactor: 1/ratio,
      heightFactor: 1/ratio,
      child: Transform.scale(
        scale: ratio,
        child: child
      )
    );
  }
}