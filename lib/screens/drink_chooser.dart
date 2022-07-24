import 'package:drink_dispenser/components/image_button.dart';
import 'package:drink_dispenser/screens/drink_customizer.dart';
import 'package:flutter/material.dart';

class DrinkChooser extends StatefulWidget {
  const DrinkChooser({Key? key}) : super(key: key);

  @override
  State<DrinkChooser> createState() => _DrinkChooserState();
}

class _DrinkChooserState extends State<DrinkChooser> {

  void _customizeDrink() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const DrinkCustomizer()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 4/5),
        itemBuilder: (context, index) => ImageButton(imageAsset: 'assets/images/drink.jpg', text: 'Vodka Lemon', onClick: _customizeDrink,),
      )
    );
  }
}