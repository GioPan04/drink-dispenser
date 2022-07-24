import 'package:drink_dispenser/components/image_button.dart';
import 'package:flutter/material.dart';

class TypeChooser extends StatefulWidget {
  const TypeChooser({Key? key}) : super(key: key);

  @override
  State<TypeChooser> createState() => _TypeChooserState();
}

class _TypeChooserState extends State<TypeChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cosa preferisci?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageButton(text: 'Bevanda', imageAsset: 'assets/images/bevande.jpg'),
                SizedBox(width: 16.0,),
                ImageButton(text: 'Drink', imageAsset: 'assets/images/drink.jpg')
              ],
            )
          ],
        ),
      ),
    );
  }
}