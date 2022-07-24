import 'package:drink_dispenser/components/image_button.dart';
import 'package:drink_dispenser/models/drink.dart';
import 'package:drink_dispenser/providers/menu_provider.dart';
import 'package:drink_dispenser/screens/drink_customizer.dart';
import 'package:flutter/material.dart';

class DrinkChooser extends StatefulWidget {
  const DrinkChooser({Key? key}) : super(key: key);

  @override
  State<DrinkChooser> createState() => _DrinkChooserState();
}

class _DrinkChooserState extends State<DrinkChooser> {

  void _customizeDrink(Drink drink) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => DrinkCustomizer(drink: drink)
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Drink> drinks = MenuProvider.of(context).menu.drinks;

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: drinks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 4/5),
        itemBuilder: (context, index) {
          final Drink drink = drinks[index];
          
          return ImageButton(
            imageAsset: drink.image,
            text: drink.name,
            onClick: () => _customizeDrink(drink)
          );
        },
      )
    );
  }
}