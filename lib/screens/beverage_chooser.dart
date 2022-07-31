import 'package:drink_dispenser/components/image_button.dart';
import 'package:drink_dispenser/models/beverage.dart';
import 'package:drink_dispenser/models/drink.dart';
import 'package:drink_dispenser/providers/menu_provider.dart';
import 'package:drink_dispenser/screens/drinking.dart';
import 'package:drink_dispenser/services/dispenser.dart';
import 'package:flutter/material.dart';

class BeverageChooser extends StatefulWidget {
  const BeverageChooser({Key? key}) : super(key: key);

  @override
  State<BeverageChooser> createState() => _BeverageChooserState();
}

class _BeverageChooserState extends State<BeverageChooser> {

  void _drink(Beverage beverage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DrinkingScreen(name: beverage.name)));
    DispenderService.simpleDrink(beverage.pin);
  }


  @override
  Widget build(BuildContext context) {
    final List<Beverage> beverages = MenuProvider.of(context).menu.beverages;

    return Scaffold(
      appBar: AppBar(title: const Text('Scegli la bevanda')),
      body: GridView.builder(
        itemCount: beverages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 4/5),
        itemBuilder: (context, i) {
          final Beverage beverage = beverages[i];
      
          return ImageButton(
            imageAsset: beverage.image,
            text: beverage.name,
            onClick: () => _drink(beverage),
          );
        },
      ),
    );
  }
}