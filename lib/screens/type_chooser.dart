import 'package:drink_dispenser/components/image_button.dart';
import 'package:drink_dispenser/screens/beverage_chooser.dart';
import 'package:drink_dispenser/screens/drink_chooser.dart';
import 'package:flutter/material.dart';

class TypeChooser extends StatefulWidget {
  const TypeChooser({Key? key}) : super(key: key);

  @override
  State<TypeChooser> createState() => _TypeChooserState();
}

class _TypeChooserState extends State<TypeChooser> {

  void _chooseDrink() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const DrinkChooser()
    ));
  }

  void _chooseBeverage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const BeverageChooser()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cosa preferisci?'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageButton(
                  text: 'Bevanda',
                  imageAsset: 'assets/images/bevande.jpg',
                  onClick: _chooseBeverage,
                ),
                const SizedBox(width: 16.0),
                ImageButton(
                  text: 'Drink',
                  imageAsset: 'assets/images/drink.jpg',
                  onClick: _chooseDrink,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}